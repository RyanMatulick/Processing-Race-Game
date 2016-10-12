boolean EnterRainbowWavesVis;

void DisplayRainbowWaves()
{
  DynamicRainbowWavesSetup();
  scale(Rscale);
  DynamicRainbowWavesDraw();
  scale(-Rscale);
}

ArrayList <Branch> RBranches;
float [] RTempSpectrum;
float RBranchWidth = 0.5;
float Rrotate;
float Rscale = 0.2;
float RHorizontalShift;

void DynamicRainbowWavesSetup()
{
  //Only run if first time entering.
  if (EnterRainbowWavesVis == false)
  {
    
    RBranches = new ArrayList<Branch>();
    RTempSpectrum = new float[bands];
    //FFTBarsSetup(); 
    
    for (int i = 0; i < bands/FFTView; i++) 
    {
      RBranches.add(new Branch());
      RTempSpectrum[i] = 0;
    }
    EnterRainbowWavesVis = true;
    background(0);
  
    //-----
    Rpx = Rradius;
    Rpy = 0;
  }
  //DrawSideBar();
  Rrotate += 0.1; 
  fft.analyze();
  RHorizontalShift += RBranchWidth;

}






//------------------------------------------
float Rdist = 40;
float Rradius = Rdist/2;
float Ralpha = 0;
float Rspeed = 500;
float Rpx, Rpy, Rx, Ry, Rk;


void DynamicRainbowWavesDraw()
{
  Rk = Rspeed/Rradius;
  Ralpha += Rk;
  Rradius += Rdist/(360/Rk);
  translate(0, height/2*(1/Rscale));
  
   for (int i = 0; i < bands/FFTView; i++) 
  {
    
      RBranches.get(i).y1 += RTempSpectrum[i]*Rradius*cos(radians(Ralpha));
      RBranches.get(i).y2 += fft.spectrum[i]*-Rradius*sin(radians(Ralpha));
     
      RBranches.get(i).x1 += RBranchWidth;
      RBranches.get(i).x2 += RBranchWidth;
      
      RTempSpectrum[i] = fft.spectrum[i];
      
      Point first = new Point(RBranches.get(i).x1,RBranches.get(i).y1);
      Point second = new Point(RBranches.get(i).x2,RBranches.get(i).y2);
      
      Line segment = new Line(first,second);
      RBranches.get(i).addLine(segment);
   
      colorMode(HSB);
     
      stroke(i*255/(bands/FFTView), 255, 255);
      RBranches.get(i).display(1);
      colorMode(RGB);

  } 
  translate(0, -height/2*(1/Rscale));
}