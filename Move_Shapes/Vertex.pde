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
      update();
      strokeWeight(5);
      stroke(R,G,B);
      point(xpos,ypos);
      
      if(IsSelected)
      {R = 0;G = 0;B = 255;}
      else
    {R = 0;G = 0;B = 0;}
      
    }
    
    void update()
    {
      if(IsSelected)
      {
        R = 0;
        G = 255;
        B = 0;
      }
      else if(IsOver) 
      {
        R = 0;
        G = 255;
        B = 255;
      }
      
      else
      {
        R = 0;
        G = 0;
        B = 0;
      }   
    }
}