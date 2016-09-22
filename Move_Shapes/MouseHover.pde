void mouseHover()
{
 for (int i = 0; i< PointArray.size(); i++)
  {
    Vertex Point = PointArray.get(i);
    if((Point.xpos+3 >=MyMouseX && Point.xpos-3 <=MyMouseX)&&(Point.ypos+3 >=MyMouseY && Point.ypos-3 <=MyMouseY))
    {
      Point.IsOver = true;
    }
    else
    {
      Point.IsOver = false;
    } 
  }
}