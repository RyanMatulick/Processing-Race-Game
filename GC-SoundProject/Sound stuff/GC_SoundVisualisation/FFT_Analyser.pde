// used to "zoom" in order to not view really high frequencies
int FFTView = 1;
import processing.sound.*;
// Declare the processing sound variables 
SoundFile sample;
FFT fft;
AudioDevice device;
// Declare a scaling factor
int scale=20;
// Define how many FFT bands we want
int bands = 256;
// declare a drawing variable for calculating rect width
float r_width;
// Create a smoothing vector
float[] sum = new float[bands];
// Create a smoothing factor
float smooth_factor = 0.4;

float rotate_factor = 0.001;

void FFTBarsSetup()
{
 
  // Calculate the width of the rects depending on how many bands we have
  r_width = width/float(bands);
  
  //Load and play a soundfile and loop it. This has to be called 
  // before the FFT is created.
  
  sample = new SoundFile(this, "intervals.mp3");
  
  sample.play();

  // Create and patch the FFT analyzer
  fft = new FFT(this, bands);
  fft.input(sample);
  
}      

void FFTMenuBars()
{
  // Set background color, noStroke and fill color
  
  background(125,255,125);
  fill(255,0,150);
  noStroke();
 
  fft.analyze();
  for (int i = 0; i < bands/FFTView; i++) 
  {
    // smooth the FFT data by smoothing factor
    sum[i] += (fft.spectrum[i] - sum[i]) * smooth_factor;
    // draw the rects with a scale factor
    rect( (i)*r_width*FFTView, height, r_width*FFTView, -sum[i]*height*scale );
  }
  
  text(smooth_factor,width-50,30);
 
}
//-----------------------------------------------------------------------------------------------