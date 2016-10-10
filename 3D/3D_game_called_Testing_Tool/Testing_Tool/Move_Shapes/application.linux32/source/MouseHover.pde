void mouseHover()
{
 for (int i = 0; i< PointArray.size(); i++)
  {
    Vertex Point = PointArray.get(i);
    if((Point.x+3 >=MyMouseX && Point.x-3 <=MyMouseX)&&(Point.y+3 >=MyMouseY && Point.y-3 <=MyMouseY))
    {
      Point.IsOver = true;
    }
    else
    {
      Point.IsOver = false;
    } 
  }
}