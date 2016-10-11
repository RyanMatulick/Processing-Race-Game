// This sketch shows how to use the FFT class to analyze a stream  
// of sound. Change the variable bands to get more or less 
// spectral bands to work with. Smooth_factor determines how
// much the signal will be smoothed on a scale form 0-1.

import processing.sound.*;

// Declare the processing sound variables 
SoundFile sample;
FFT fft;
AudioDevice device;

public void setup() {
  size(640, 360);
  background(255);

  sample = new SoundFile(this, "Intervals.MP3");
  sample.loop();

}      

public void draw() {
 
}