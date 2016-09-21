void mousePressed()
{
  boolean OverPoint = false;
  
  for(int i = 0; i< PointArray.size(); i++)
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
        }
      }
      else
      {
        Point.IsSelected = false;      
      }
    }
  } 
  
  if ((OverPoint != true) && (keyPressed == false)) // We are not over a point
  {   
    Vertex point = new Vertex(MyMouseX,MyMouseY,0);
    newPoint = true;
    
    if(PointArray.size()<=0)
    {
      PointArray.add(point);
      PointArray.get(0).ID = 0;
      PointArray.add(point);
      PointArray.get(1).ID = 0;
    }
    
    else if(PointArray.size()>=2)
    {
      PointArray.set(PointArray.size()-1,point);
      PointArray.get(PointArray.size()-1).ID = PointArray.size()-1;
      PointArray.add(new Vertex(PointArray.get(0).xpos, PointArray.get(0).ypos, PointArray.get(0).zpos));
    }
  }
  /////////////////////////////VLineV////////////////////////////////////////////////////////////////////////// 
  for(int i = 0; i< LineArray.size(); i++)
  {
    Line line = LineArray.get(i);
    
    if (line.IsOver == true) // If we are over the point and we click
    {
      if (keyPressed)
      {
        if (key == 'o') // if we are holding 'o'
        {
          line.IsSelected = true;
          line.B = 255;
        }
      }
    }  
    
    else // if we click anywhere else
    {      
      if (keyPressed)
      {
        if (key != 'o') // if we are not holding shift
        {
          line.IsSelected = false;
          line.B = 0;         
        }
      }
      else
      {
        line.IsSelected = false;
        line.B = 0;
      }
    }
  } 
 } 
 
 void AddMidPoint(Line line)
{
  Vertex p1, p2;
  
  if(line.IsSelected)
  {
    if(line.p1.ID > line.p2.ID)
    {p1 = line.p2; p2 = line.p1;}
    else
    {p2 = line.p2; p1 = line.p1;}
  }
}
 
 
 
 
 