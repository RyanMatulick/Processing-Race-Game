void mousePressed()
{
  boolean OverPoint = false;
  for (int i = 0; i< PointArray.size(); i++) // check EveryPoint
  {
    Vertex Point = PointArray.get(i);
    
    if (Point.IsOver == true) // If we are over the point and we click
    {
      OverPoint = true;
      if (keyPressed)
      {
        if (keyCode == SHIFT) // if we are holding shift
        {
          Point.IsSelected = true;
          LinePoints.add(Point);
          Point.B = 255;
        }
      }
    }
    else // if we click anywhere else
    {
      if (keyPressed)
      {
        if (keyCode != SHIFT) // if we are not holding shift
        {
          Point.IsSelected = false;
          Point.B = 0;
          LinePoints.remove(LinePoints.size());
        }
      }
      else
      {
        Point.IsSelected = false;
        Point.B = 0;
      }
    }
  }
  if (OverPoint != true) // We are not over a point
  {
    Vertex point = new Vertex(MyMouseX,MyMouseY,0);
    PointArray.add(point); // add a point to the array
    LinePoints.add(point); // add a point to the line points array
  }
}