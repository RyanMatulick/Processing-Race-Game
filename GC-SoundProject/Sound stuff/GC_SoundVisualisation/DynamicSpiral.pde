
boolean EnterDynamicSpiralVis;
float Sscale = 0.5;

void DisplayDynamicSpiral()
{
  DynamicSpiralSetup();
  scale(Sscale);
  DynamicSpiralDraw();
  scale(-Sscale);
}

void DynamicSpiralSetup()
{
  //Only run if first time entering.
  if (EnterDynamicSpiralVis == false)
  {
    radius = new float[bands];
    alpha = new float[bands];
    k = new float[bands];
    px = new float[bands];
    py = new float[bands];
    x = new float[bands];
    y = new float[bands];
    //FFTBarsSetup(); 
    
    for (int i = 0; i < bands/FFTView; i++) 
    {
      radius[i] = 1;
      alpha[i] = 0;
      px[i] = 1;
      py[i] = 0;
    }
    EnterDynamicSpiralVis = true;
    background(0);
  }
  fft.analyze();
}

//------------------------------------------
float dist = 1;
float speed = 50;

float [] px;
float [] py;
float [] x;
float [] y;
float [] radius;
float [] alpha;
float [] k;

void DynamicSpiralDraw()
{
  translate( width/2*(1/Sscale), height/2*(1/Sscale));
  for (int i = 0; i < bands/FFTView; i++) 
  {
    k[i] = speed/radius[i];
    alpha[i] += k[i];
    radius[i] += dist/(360/k[i])+fft.spectrum[i]*10;
    x[i] = radius[i]*cos(radians(alpha[i]));
    y[i] = -radius[i]*sin(radians(alpha[i]));
    
    colorMode(HSB);
    stroke(i*255/(bands/FFTView), 255, 255);
    line(px[i], py[i], x[i], y[i]);
    px[i] = x[i];
    py[i] = y[i];
    colorMode(RGB);
  }
  translate( -width/2*(1/Sscale), -height/2*(1/Sscale));
 
}