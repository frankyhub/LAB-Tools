//Board Generic ESP8266 Module
#define ESP32_NODEMCU 1

#include "NerfNeoPixelAnimations.h"

#define DEBUG
#define NUMBER_TARGETS 10
#define USE_OPEN_WLAN
// #define USE_WEB_SERVER

#ifdef USE_WEB_SERVER
    #include <ESP8266WiFi.h>
    #include <ESP8266WebServer.h>
    #include <SPI.h>
    #include <FS.h>

    // Replace with your network credentials
    const char *ssid = "xxx";
    const char *password = "xxx";

    // Set web server port number to 80
    // WiFiServer server(80);
    ESP8266WebServer  server(80);
    String index_html;
#endif



uint64_t hitTimeMillis = 0;
uint64_t hitBlockTime_ms = 2000;
uint64_t buzzerBeepTime_ms = 500;
int hitTargetIdx = -1;
int hitSum = 0;
int hitCount = 0;

#ifdef WEMOS_LOLIN_8266
    // D0..D8: 16, 5, 4, 0, 2, 14, 12, 13, 15
    // SDD2: 9, SDD3: 10
    #define PIN_BUZZER 15
    #define PIN_NEO_PIXEL T.B.D 
    TNerfTarget pinsForTargets[NUMBER_TARGETS] = 
        {{16, 10, 1}, {5, 5, 2}, {4, 30, 3},
        {0, 10, 4}, {2, 20, 5}, {14, 10, 6}, {12, 15, 7},
        {13, 40, 8}, {3, 25, 9}, {9, 60, 10}};
#endif

#ifdef ARDUINO_UNO_NANO
    #define PIN_BUZZER 13
    #define PIN_NEO_PIXEL 12
    TNerfTarget pinsForTargets[NUMBER_TARGETS] = 
        {{2, 10, 1}, {3, 5, 2}, {4, 30, 3},
        {5, 10, 4}, {6, 20, 5}, {7, 10, 6}, {8, 15, 7},
        {9, 40, 8}, {10, 25, 9}, {11, 60, 10}};
#endif

const TPixelColor color_red = {255, 0, 0};
const TPixelColor color_green = {0, 255, 0};
const TPixelColor color_blue = {0, 0, 255};
const TPixelColor color_violett = {128, 0, 128};
const TPixelColor color_pink = {255, 192, 203}; 

#ifdef ESP32_NODEMCU
    // use Board: NODEMCU-32s
    #define PIN_BUZZER 15
    #define PIN_NEO_PIXEL 21
    #define PIN_RESET_VALUES 26
    TNerfTarget pinsForTargets[NUMBER_TARGETS] =  // {gpio, value, id)
        {{23, 2, 1, color_red}, {22, 4, 2, color_pink}, {19, 2, 3, color_violett},
        {18, 3, 4, color_violett}, {5, 5, 5, color_green}, {17, 5, 6}, {16, 3, 7, color_violett},
        {4, 4, 8, color_pink}, {0, 1, 9, color_blue}, {2, 2, 10, color_red}};
#endif

NerfNeoPixelAnimations nerfNeoPixelDisplay(25, PIN_NEO_PIXEL, 25);

#ifdef USE_WEB_SERVER

    void initSPIFFS()
    {

        #ifdef ARDUINO_ARCH_ESP32
            SPIFFS.begin(true); // enable format if mount fails (only for ESP32)
        #else
            SPIFFS.begin();
        #endif
            delay(100);

            Serial.println("SPIFFS Information:");
        #ifdef ARDUINO_ARCH_ESP32
            // different methods of getting information
            Serial.print("Total bytes:    ");
            Serial.println(SPIFFS.totalBytes());
            Serial.print("Used bytes:     ");
            Serial.println(SPIFFS.usedBytes());
        #else
            FSInfo fs_info;
            SPIFFS.info(fs_info);
            Serial.print("Total bytes:    ");
            Serial.println(fs_info.totalBytes);
            Serial.print("Used bytes:     ");
            Serial.println(fs_info.usedBytes);
            Serial.print("Block size:     ");
            Serial.println(fs_info.blockSize);
            Serial.print("Page size:      ");
            Serial.println(fs_info.pageSize);
            Serial.print("Max open files: ");
            Serial.println(fs_info.maxOpenFiles);
            Serial.print("Max path length:");
            Serial.println(fs_info.maxPathLength);
            Serial.println();
        #endif
    }


    String readFileFromSPIFFS(char *filename)
    {
        String content;
        if (SPIFFS.exists(filename))
        {
            Serial.println("Found sample file.");

            File f = SPIFFS.open(filename, "r");
            if (!f)
            {
                Serial.println("Failed to open file for reading");
                return content;
            }
            Serial.println("Opened file for reading. File contents:\n");

            while (f.available())
            {
                //content += f.readStringUntil('\n')a;
                content += f.readString();
            }
            f.close();
            Serial.println(content);

            Serial.println("\n\nEnd of file contents.");
        }
        else
            Serial.println("Sample file not found.");

        return content;
    }


    void startWebServer()
    {
        // Connect to Wi-Fi network with SSID and password
        Serial.print("Setting AP (Access Point)…");
        // Remove the password parameter, if you want the AP (Access Point) to be open
        #ifdef USE_OPEN_WLAN
            WiFi.softAP(ssid);
        #else
            WiFi.softAP(ssid, password);
        #endif

        IPAddress IP = WiFi.softAPIP();
        Serial.print("AP IP address: ");
        Serial.println(IP);

        Serial.println("Starting web server!");
        server.begin();
    }

#endif

void setup()
{
    Serial.begin(115200);
    //while (!Serial)
    //    ; //if just the the basic function, must connect to a computer
    delay(1000);

    Serial.println("");
    Serial.println("NERF Schießstand");

    pinMode(PIN_BUZZER, OUTPUT);
    pinMode(PIN_RESET_VALUES, INPUT_PULLUP);
    for (byte i=0; i<NUMBER_TARGETS; i++)
    {
        pinMode(pinsForTargets[i].pinId, INPUT_PULLUP);
    }

#ifdef USE_WEB_SERVER
    SPI.begin();     
    initSPIFFS();
    initWebServer();
    startWebServer();
#endif
    nerfNeoPixelDisplay.init();
    nerfNeoPixelDisplay.clear();
}

void checkHit() 
{
    if (hitTargetIdx >= 0)
    {
        if ((millis() - hitTimeMillis > buzzerBeepTime_ms) && (digitalRead(PIN_BUZZER) == HIGH))
        {
            digitalWrite(PIN_BUZZER, LOW);
            Serial.println("Buzzer off");
        }
        if (millis() - hitTimeMillis > hitBlockTime_ms)
        {
            hitTargetIdx = -1;
            Serial.println("Reset hit debounce");
        }
        return;
    }
    else 
    {
        if (digitalRead(PIN_RESET_VALUES) == LOW)
        {
            hitCount = 0;
            hitSum = 0;
            nerfNeoPixelDisplay.clear();
            Serial.println("Start new game");
            return;
        }
        for (byte i=0; i<NUMBER_TARGETS; i++)
        {
            if ((digitalRead(pinsForTargets[i].pinId) == LOW) && (hitTargetIdx < 0))
            {
                
                hitCount++;
                hitTargetIdx = i;
                hitTimeMillis = millis();
                hitSum += pinsForTargets[i].targetValue;
                digitalWrite(PIN_BUZZER, HIGH);
                Serial.print("Treffer: ");
                Serial.print(pinsForTargets[i].targetId);
                Serial.print("  Wert: ");
                Serial.print(pinsForTargets[i].targetValue);
                Serial.print("  PinId: ");
                Serial.print(pinsForTargets[i].pinId);
                Serial.print("  ArrayIdx: ");
                Serial.println(i);
//                nerfNeoPixelDisplay.showNerfScore(hitSum);
                nerfNeoPixelDisplay.showNerfScore(pinsForTargets[i]);
                return;
            }
        }
    }
}

void loop()
{
    checkHit();
    #ifdef USE_WEB_SERVER
        server.handleClient();
    #endif
}
