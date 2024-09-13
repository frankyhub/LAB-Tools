
#ifndef NerfNeoPixelAnimations_h
#define NerfNeoPixelAnimations_h
#include <Adafruit_NeoPixel.h>


typedef struct 
{
    byte red;
    byte green;
    byte blue;
} TPixelColor;

typedef struct { 
    byte pinId;   // GPIO Pin Id
    int targetValue;   // Received points for hit
    int targetId;      // Running ID for target
    TPixelColor color;
} TNerfTarget;


class NerfNeoPixelAnimations 
{
    private:
        Adafruit_NeoPixel pixels; 
        int n_pixel;
        byte pin;
        int maxNerfScore;
        int displayDelay_ms;
        int nerfScore;
        // TPixelColor[MAX_PIXELS] pixelColors;
        int idx_pixel_pos;
    public:
        float intensity = 1.0;

    public:
        NerfNeoPixelAnimations(int n_pixel, byte pin, int maxNerfScore);
        void init();
        void show();
        void clear();

        void setPixel(int i_pixel, TPixelColor rgb, float relative_intensity=1.0);

        void showNerfScore(int nerfScore);
        void showNerfScore(TNerfTarget& nerfTarget);
};

#endif
