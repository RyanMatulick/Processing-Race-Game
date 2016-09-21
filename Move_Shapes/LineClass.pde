static int GLID = 0;
class Line
{
  Vertex p1;
  Vertex p2;
  
  float Xpos1;
  float Ypos1;
  float Xpos2;
  float Ypos2;
  float Slope;
  float C;
  float EQx;
  float EQy;
  
  boolean IsOver;
  boolean IsSelected;
  
  int ID;
  int R;
  int G;
  int B;
  Line(Vertex point1, Vertex point2)
  {
    UpdatePoints(point1,point2);
    IsOver = false;
    IsSelected = false;
    R = 255;
    G = 0;
    B = 0;
    ID = GLID;
    GLID++;
  }
  
  void Display()
  {
   stroke(R,G,B);
   strokeWeight(1);
   line(Xpos1,Ypos1,Xpos2,Ypos2);
   
   if(IsSelected)
   {
     p1.IsSelected = true;
     p2.IsSelected = true;
   }
  }
  
  void GenerateEquation()
  {
    Slope = (Ypos2-Ypos1)/(Xpos2-Xpos1);
    C = Ypos1 - Slope*Xpos1;
  }
  void UpdatePoints(Vertex point1, Vertex point2)
  {
    p1 = point1;
    p2 = point2;
    Xpos1 = point1.xpos;
    Ypos1 = point1.ypos;
    Xpos2 = point2.xpos;
    Ypos2 = point2.ypos;
    GenerateEquation();
  }
  
  boolean CheckinLineDomain(boolean realSlope) //check to see if the mosue cursor is with in the lines domain
  {
    float x1r, x2r, y1r, y2r; //Line restraints 
    
    if(Xpos1 > Xpos2)
    {x1r = Xpos2; x2r = Xpos1;}
    else
    {x2r = Xpos2; x1r = Xpos1;}
    
    if(Ypos1 > Ypos2) 
    {y1r = Ypos2; y2r = Ypos1;}
    else
    {y2r = Ypos2; y1r = Ypos1;}
    
    if(realSlope)
    {
      if(Slope != 0)
      {        
        if(mouseX > x1r && mouseX < x2r && mouseY > y1r && mouseY < y2r)
        {return true;}
        else
        {return false;}
      }
      
      else
      {
        if(mouseX > x1r && mouseX < x2r)
        {return true;}
        else
        {return false;}
      }
    }
    else
    {
      if(mouseY > y1r && mouseY < y2r)
      {return true;}
      else
      {return false;}    
    }
  }
  
  boolean CheckifRealSlope()// checks to see if the line's slope is not undefined
  {
    if(Xpos2-Xpos1 != 0)
    {            
      return true;
    }
    
    else
    {return false;}
  }
  
  void CheckOnLine()
  { 
    if(CheckifRealSlope())
    {EQy = (Slope*mouseX) + C; EQx = (mouseY - C)/Slope;}
  
    if (((mouseX >= EQx-7 && mouseX <= EQx+7) || (mouseY > EQy-7 && mouseY < EQy+7)) && CheckifRealSlope() && CheckinLineDomain(CheckifRealSlope()))
    {     
      R = 0;
      G = 255;
      IsOver = true;
    }
    
    
    else if(Xpos2-Xpos1 == 0)
    {
      if (mouseX >= Xpos1-7 && mouseX <= Xpos1+7 && CheckinLineDomain(CheckifRealSlope()))
      {
        R = 0;
        G = 255;
        IsOver = true;
      }
      
      else
      {
        R = 255;
        G = 0;
        IsOver = false;
      }
    }    
    
    else
    {
      R = 255;
      G = 0;
      IsOver = false;
    }
  }
  
}