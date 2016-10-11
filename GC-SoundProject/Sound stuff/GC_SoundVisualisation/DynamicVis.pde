boolean EnterDynamicVis;

void DisplayDynamicVis()
{
  DynamicVisSetup();
  
}

ArrayList <Branch> Branches;
float HorizontalShift;
float [] TempSpectrum;
void DynamicVisSetup()
{
  
  
  background(255);
  
  //Only run if first time entering.
  if (EnterDynamicVis == false)
  {
    Branches = new ArrayList<Branch>();
    TempSpectrum = new float[bands];
    FFTBarsSetup(); 
    
    stroke(255,0,0);
    for (int i = 0; i< 20; i++)
    {
      line(i*(120*0.6),0,i*(120*0.6),1000);
    }
    
    for (int i = 0; i < bands/FFTView; i++) 
    {
      Branches.add(new Branch());
      TempSpectrum[i] = 0;
    }
    EnterDynamicVis = true;
  }
  
  //HorizontalShift += 0.5;
  fft.analyze();
 
  for (int i = 0; i < bands/FFTView; i++) 
  {
      
      Branches.get(i).y1 += TempSpectrum[i]*30;
      Branches.get(i).y2 += fft.spectrum[i]*30;
      Branches.get(i).x1 += 0.6;
      Branches.get(i).x2 += 0.6;
      
      TempSpectrum[i] = fft.spectrum[i];
      
      Point first = new Point(Branches.get(i).x1,Branches.get(i).y1);
      Point second = new Point(Branches.get(i).x2,Branches.get(i).y2);
      
      Line segment = new Line(first,second);
      
      translate(rotate_factor,0);
      Branches.get(i).addLine(segment);
      Branches.get(i).display(130); 
      translate(-rotate_factor,0);
      
  }
  
}



class Branch
{
  ArrayList <Line> linelist = new ArrayList(); 
  float x1;
  float x2;
  float y1;
  float y2;
  int I;
  Branch()
  {
    x1 = 0;
    x2 = 0.6;
    y1 = 0;
    y2 = 0;
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