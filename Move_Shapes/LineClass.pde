static int GLID = 0;
class Line
{
  Vertex point1;
  Vertex point2;
  
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
  Line(Vertex p1, Vertex p2)
  {
    GenerateEquationFactors(p1, p2);
    IsOver = false;
    IsSelected = false;
    R = 255;
    G = 0;
    B = 0;
    ID = GLID++;
  }
  
  void Display()
  {
   stroke(R,G,B);
   strokeWeight(1);
   line(point1.x,point1.y,point2.x,point2.y);  
  }
  
  void update()
  {
    CheckOnLine();

    if(IsSelected)
    {
      point1.IsSelected = true;
      point2.IsSelected = true;
      R = 255;
      G = 0;
      B = 255;
    }
    else if(IsOver) 
    {
      R = 0;
      G = 255;
      B = 0;
    }
 
    if (keyPressed && key == 'l' && IsSelected) // if we are not holding shift
    {IsSelected = false;}
  }
  
  void GenerateEquationFactors(Vertex p1, Vertex p2)
  {
    point1 = p1;
    point2 = p2;
    Slope = (point2.y-point1.y)/(point2.x-point1.x);
    C = point1.y - Slope*point1.x;
  } //<>// //<>// //<>//
  
  boolean CheckinLineDomain(boolean realSlope) //check to see if the mosue cursor is with in the lines domain
  {
    float x1r, x2r, y1r, y2r; //Line restraints 
    
    if(point1.x > point2.x)
    {x1r = point2.x; x2r = point1.x;}
    else
    {x2r = point2.x; x1r = point1.x;}
    
    if(point1.y > point2.y) 
    {y1r = point2.y; y2r = point1.y;}
    else
    {y2r = point2.y; y1r = point1.y;}
    
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
    if(point2.x-point1.x != 0)
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
    
    
    else if(point2.x-point1.x == 0)
    {
      if (mouseX >= point1.x-7 && mouseX <= point1.x+7 && CheckinLineDomain(CheckifRealSlope()))
      {
        R = 0;
        G = 255;
        B = 0;
        IsOver = true;
      }
      
      else
      {
        R = 255;
        G = 0;
        B = 0;
        IsOver = false;
      }
    }    
    
    else
    {
      R = 255;
      G = 0;
      B = 0;
      IsOver = false;
    }
  }  
}