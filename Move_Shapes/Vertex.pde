class Vertex
{
 int ID;
 float xpos;
 float ypos;
 float zpos;
 int R;
 int B;
 int G;
 boolean IsOver;
 boolean IsSelected;
  Vertex(float x, float y,float z)
  {
    xpos = x;
    ypos = y;
    zpos = z;
    R = 0;
    B = 0;
    G = 0;
    IsOver = true;
    IsSelected = false;
  }
 
    void plot()
    {
      strokeWeight(5);
      stroke(R,B,G);
      point(xpos,ypos);
      
      if(IsSelected)
      {R = 0;G = 0;B = 255;}
      else
    {R = 0;G = 0;B = 0;}
      
    }
}