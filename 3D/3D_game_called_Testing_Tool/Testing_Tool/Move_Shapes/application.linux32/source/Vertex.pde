class Vertex
{
 int ID;
 float x;
 float y;
 int R;
 int B;
 int G;
 boolean IsOver;
 boolean IsSelected;
  Vertex(float tempX, float tempY)
  {
    x = tempX;
    y = tempY;
    R = 0;
    B = 0;
    G = 0;
    IsOver = true;
    IsSelected = false;
  }
 
  void plot()
  {
    strokeWeight(5);
    stroke(R,G,B);
    point(x,y);   
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
    
    if (keyPressed && key == 'p' && IsSelected) // if we are not holding shift
    {IsSelected = false;}
    
  }
}