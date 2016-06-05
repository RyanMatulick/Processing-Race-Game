static int GID = 0;
class Vertex
{
 int ID;
 float xpos;
 float ypos;
 float zpos;
 int R;
 int B;
 boolean IsOver;
 boolean IsSelected;
  Vertex(int x, int y,int z)
  {
    xpos = x;
    ypos = y;
    zpos = z;
    R = 255;
    B = 255;
    IsOver = true;
    IsSelected = true;
    ID = GID;
    GID++;
  }
  void plot()
  {
    strokeWeight(5);
    stroke(R,B,0);
    point(xpos,ypos);
  }
}