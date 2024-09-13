//#include <math.h>
#include "NerfNeoPixelAnimations.h"

NerfNeoPixelAnimations::NerfNeoPixelAnimations(int n_pixel, byte pin, int maxNerfScore) :
    pixels((unsigned int)n_pixel, pin, NEO_GRB + NEO_KHZ800),
    n_pixel(n_pixel),
    pin(pin),
    displayDelay_ms(300),
    maxNerfScore(maxNerfScore),
    idx_pixel_pos(-1)
{

}

void NerfNeoPixelAnimations::init()
{
    pixels.begin();
    Serial.print("N_PIXEL=");
    Serial.println(n_pixel);
}

void NerfNeoPixelAnimations::show()
{
    #if ESP32
        delay(10);
    #endif
        pixels.show();
    delay(displayDelay_ms);
}

void NerfNeoPixelAnimations::clear()
{
    this->idx_pixel_pos = -1;
    pixels.clear();
    delay(displayDelay_ms);
    pixels.show();
} 

void NerfNeoPixelAnimations::setPixel(int i_pixel, TPixelColor rgb, float relative_intensity)
{
    byte rd = (byte) ((float)rgb.red * intensity * relative_intensity);
    byte gn = (byte) ((float)rgb.green * intensity * relative_intensity);
    byte bl = (byte) ((float)rgb.blue * intensity * relative_intensity);

    //Serial.println(i_pixel);
    /*
    if (i_pixel == -1) 
    {
        Serial.print(rd);
        Serial.print("-");
        Serial.print(gn);
        Serial.print("-");
        Serial.println(bl);
    }
    */
    if (i_pixel >= 0 && i_pixel < n_pixel)
        pixels.setPixelColor(i_pixel, rd, gn, bl);
}



void NerfNeoPixelAnimations::showNerfScore(int nerfScore)
{
    // clipping
    this->nerfScore = min(max(0, nerfScore), this->maxNerfScore);

    // scale
    int n_nerfPixel = (int)((this->nerfScore / this->maxNerfScore) * this->n_pixel);

    Serial.print("showNerfScore: ");
    Serial.println(nerfScore);
    Serial.print("  n_nerfPixel: ");
    Serial.println(n_nerfPixel);

    pixels.clear();

    float relative_intensity = 1.0;
    float range;
    for (int pos=0; pos<n_nerfPixel; pos++)
    {
        range = ((float) pos) / this->n_pixel;
        if (range < 0.2)
            setPixel(pos, {255, 0, 0}, relative_intensity);
        else if (range < 0.4)
            setPixel(pos, {0, 0, 255}, relative_intensity);
        else if (range < 0.7)
            setPixel(pos, {0, 255, 0}, relative_intensity);
        else
            setPixel(pos, {255, 255, 255}, relative_intensity);
    }

    show();
    delay(displayDelay_ms);
}


void NerfNeoPixelAnimations::showNerfScore(TNerfTarget& nerfTarget)
{
    // clipping
    int nerf_score = min(max(0, nerfScore), this->maxNerfScore);

    // scale
    int n_nerfPixel = (int)((this->nerfScore / this->maxNerfScore) * this->n_pixel);

    Serial.print("showNerfScore: ");
    Serial.println(nerfScore);
    Serial.print("  n_nerfPixel: ");
    Serial.println(n_nerfPixel);

    // pixels.clear();

    float relative_intensity = 1.0;
    for (int pos=0; pos<nerf_score; pos++)
    {
      this->idx_pixel_pos++;
      if (this->idx_pixel_pos < this->n_pixel)
        setPixel(this->idx_pixel_pos, nerfTarget.color, relative_intensity);
    }

    show();
    delay(displayDelay_ms);
}
