boolean EnterDynamicVis;

void DisplayDynamicVis()
{
  DynamicVisSetup();
  
  //rotate(rotate_factor);
  DynamicVisInstantDraw();
  //DynamicVisDraw();
  //rotate(-0.01);
}

ArrayList <Branch> Branches;
float HorizontalShift;
float [] TempSpectrum;
float BranchWidth = 4;

void DynamicVisSetup()
{
  //Only run if first time entering.
  if (EnterDynamicVis == false)
  {
     FFTBarsSetup();  
    Branches = new ArrayList<Branch>();
    TempSpectrum = new float[bands];
    //FFTBarsSetup(); 
    
    for (int i = 0; i < bands/FFTView; i++) 
    {
      Branches.add(new Branch());
      TempSpectrum[i] = 0;
    }
    EnterDynamicVis = true;
  }
  
   
  background(0);
  stroke(255,0,0);
  for (int i = 0; i< 20; i++)
  {
    line(i*(120*BranchWidth),0,i*(120*BranchWidth),1000);
  }
  //HorizontalShift += 0.5;
  fft.analyze();
  HorizontalShift += BranchWidth;

  
}

void DynamicVisDraw()
{
   for (int i = 0; i < bands/FFTView; i++) 
  {
      if(Branches.get(i).y1 >= height)
      {
        Branches.get(i).Down1 = false;
      }
      else if(Branches.get(i).y1 <= 1)
      {
        Branches.get(i).Down1 = true;
      }
      
      if (Branches.get(i).Down1 == true)
      {
        Branches.get(i).y1 += TempSpectrum[i]*30;
      }
      else
      {
        Branches.get(i).y1 -= TempSpectrum[i]*30;
      }  
      
      print(TempSpectrum[i]);
      
      if(Branches.get(i).y2 >= height)
      {
        Branches.get(i).Down2 = false;
      }
      else if(Branches.get(i).y2 <= 1)
      {
        Branches.get(i).Down2 = true;
      }
      
      if (Branches.get(i).Down2 == true)
      {
        Branches.get(i).y2 += fft.spectrum[i]*30;
      }
      else
      {
        Branches.get(i).y2 -= fft.spectrum[i]*30;
      }  
      
      Branches.get(i).x1 += BranchWidth;
      Branches.get(i).x2 += BranchWidth;
      
      TempSpectrum[i] = fft.spectrum[i];
      
      Point first = new Point(Branches.get(i).x1,Branches.get(i).y1);
      Point second = new Point(Branches.get(i).x2,Branches.get(i).y2);
      
      Line segment = new Line(first,second);
      
      translate(-HorizontalShift+width-200,0);
      Branches.get(i).addLine(segment);
      colorMode(HSB);
    
      stroke(i*255/(bands/FFTView), 255, 255);

      Branches.get(i).display(100);
      
      translate(HorizontalShift-width+200,0);

  } 
}
float Dynasmooth_factor = 0.2;

void DynamicVisInstantDraw()
{   
    translate(-HorizontalShift+width-200,0);
    for (int i = 0; i < bands/FFTView; i++) 
    {
      sum[i] += (fft.spectrum[i] - sum[i]) * Dynasmooth_factor;
      Branches.get(i).y1 = TempSpectrum[i]*height*5;
      Branches.get(i).y2 = sum[i]*height*5;
    
      Branches.get(i).x1 += BranchWidth;
      Branches.get(i).x2 += BranchWidth;
      
      TempSpectrum[i] = sum[i];
      
      Point first = new Point(Branches.get(i).x1,Branches.get(i).y1);
      Point second = new Point(Branches.get(i).x2,Branches.get(i).y2);
      
      Line segment = new Line(first,second);
      
      Branches.get(i).addLine(segment);
      
      colorMode(HSB);
      stroke(i*255/(bands/FFTView), 255, 255);
      Branches.get(i).display(300);
      
     
    }
    translate(HorizontalShift-width+200,0);
    fill(255);
    text("Smoothing Factor: ",width/2-150,height-40);
    text(Dynasmooth_factor,width/2,height-40);
    text("Use n and m to modify the smoothing factor. (0-2)",width/2-150,height-20);
}



class Branch
{
  ArrayList <Line> linelist = new ArrayList(); 
  float x1;
  float x2;
  float y1;
  float y2;
  boolean Down1;
  boolean Down2;
  int I;
  Branch()
  {
    x1 = 0;
    x2 = BranchWidth;
    y1 = 0;
    y2 = 0;
    Down1 = true;
    Down2 = true;
  }
  void addLine(Line segment)
  {
    linelist.add(segment);  
  }
  void display(int Size)
  {
    
    if (linelist.size() <= Size)
    {
      I = 0; 
    }
    else
    {
      I = linelist.size()-Size; 
    }
    for (int i = I; i < linelist.size(); i++)
    {
      linelist.get(i).display();
    }
  }
}

class Line
{
  Point first;
  Point second;
  Line(Point input1, Point input2)
  {
    first = input1;
    second = input2;
  }
  void display()
  {
    line(first.x,first.y,second.x,second.y); 
  }
}

class Point
{
  float x,y;
  Point(float ix,float iy)
  {
      x = ix;
      y = iy;
  }
}