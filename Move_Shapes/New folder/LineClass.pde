class Line
{
  float Xpos1;
  float Ypos1;
  float Xpos2;
  float Ypos2;
  float Slope;
  float C;
  
  int R;
  int G;
  int B;
  Line(Vertex point1, Vertex point2)
  {
    UpdatePoints(point1,point2);
    R = 180;
    G = 0;
    B = 0;
  }
  
  void Display()
  {
   stroke(R,G,B);
   strokeWeight(1);
   line(Xpos1,Ypos1,Xpos2,Ypos2);
  }
  
  void GenerateEquation()
  {
    Slope = (Ypos2-Ypos1)/(Xpos2-Xpos1);
    C = Ypos1 - Slope*Xpos1;
  }
  void UpdatePoints(Vertex point1, Vertex point2)
  {
    Xpos1 = point1.xpos;
    Ypos1 = point1.ypos;
    Xpos2 = point2.xpos;
    Ypos2 = point2.ypos;
    GenerateEquation();
  }
  boolean CheckOnLine(int X, int Y)
  {
    if (X > Xpos1 && X < Xpos2 || X < Xpos1 && X > Xpos2)
    {
      float EQ = Slope*X + C;
      if (Y > EQ-7 && Y<EQ+7)
      {
        return true;
      }
    }
    return false;
  }
  
}