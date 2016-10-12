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