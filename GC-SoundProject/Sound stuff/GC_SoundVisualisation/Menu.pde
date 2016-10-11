boolean EnterMenu;

void DisplayMainMenu()
{
  background(255);
  if (EnterMenu == false)
  {
    FFTBarsSetup();  
    EnterMenu = true;
  }
  FFTMenuBars();
  
  for (int i = 0; i< ButtonList.size(); i++)
  {
    ButtonList.get(i).Display();  
  }
  
}

//-----------------------------------------------------------------------------------------


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
  if(EnterDynamicVis == false)
  {
    sample = new SoundFile(this, "beat.aiff");
  }
  else if(EnterMenu == false)
  {
    sample = new SoundFile(this, "intervals.mp3");
  }
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










// Button Class
Button LineButton;
class Button
{
  int ButtonX;
  int ButtonY;
  int ButtonWidth;
  int ButtonHeight;
  int R;
  int G;
  int B;
  boolean isActive;
  boolean isOver;
  Button(int xpos, int ypos, int Width, int Height)
  {
    ButtonX = xpos;
    ButtonY = ypos;
    ButtonWidth = Width;
    ButtonHeight = Height;
    isActive = false;
    isOver = false;
  }
  void Display()
  {
    getFill();
    fill(R,G,B);
    rect(ButtonX,ButtonY,ButtonWidth,ButtonHeight);
    fill(0);
    text("Line \nGraph",width-75,95);
  }
  
  void getFill()
  {
    R = G = B = 255;
    isOver = false;
    if (mouseX > ButtonX && mouseX < ButtonX + ButtonWidth)
    {
      if (mouseY > ButtonY && mouseY < ButtonY+ButtonHeight)
      {
        R = 250;
        G = 150;
        B = 150;
        isOver = true;
      
      }
    }
    if (isActive)
    {
      R = 100;
      G = 200;
      B = 100;
    }
  }
}


void mousePressed()
{
  for(int i = 0; i< ButtonList.size(); i++)
  {
    if (ButtonList.get(i).isOver == true)
    {
      if (ButtonList.get(i).isActive == true)
      {
        ButtonList.get(i).isActive = false;
      }
      else
      {
        ButtonList.get(i).isActive = true;       
      }
    }
  }
}