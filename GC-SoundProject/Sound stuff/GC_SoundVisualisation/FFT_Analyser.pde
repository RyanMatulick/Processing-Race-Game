// used to "zoom" in order to not view really high frequencies
int FFTView = 4;
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
float smooth_factor = 0.9;

//float rotate_factor = 0.001;

void FFTBarsSetup()
{
  
  // If the Buffersize is larger than the FFT Size, the FFT will fail
  // so we set Buffersize equal to bands
  device = new AudioDevice(this, 44000, bands);
  // Calculate the width of the rects depending on how many bands we have
  r_width = width/float(bands);
  
  //Load and play a soundfile and loop it. This has to be called 
  // before the FFT is created.
  
  sample = new SoundFile(this, "Piano.mf.C8.aiff");
  
  sample.loop();

  // Create and patch the FFT analyzer
  fft = new FFT(this, bands);
  fft.input(sample);
  
}      


//-----------------------------------------------------------------------------------------------