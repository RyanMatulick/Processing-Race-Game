void mousePressed()
{
  ClickPoint();
  ClickLine();
} 
 
 
void ClickPoint()
{
  boolean OverPoint = false;
  boolean lineIsSelected = a_line_is_selected();

  if(!lineIsSelected)
  {
    for(int i = 0; i< PointArray.size(); i++)
    {
      Vertex point = PointArray.get(i);
  
      if (point.IsOver == true) // If we are over the point and we click
        {
          OverPoint = true;
          if (keyPressed)
          {
            if (keyCode == SHIFT) // if we are holding shift
            {
              DeletePoint(point);
            }
                        
          }
          
          else
          {
            point.IsSelected = true;
          }
        }  
  
        else // if we click anywhere else
        {      
          if (keyPressed)
          {
            if (keyCode != SHIFT) // if we are not holding shift
            {
              point.IsSelected = false;        
            }
          }
          
          else
          {
            point.IsSelected = false;      
          }
        }
      } 
    
      if ((OverPoint != true) && (keyPressed == false)) // We are not over a point
      {   
        AppendPoint();
        newPoint = true;
      }
  }
}
 
 
void ClickLine()
{
  boolean lineIsSelected = a_line_is_selected(); 
   
  for(int i = 0; i< LineArray.size(); i++)
  {
    Line line = LineArray.get(i);

    if(!lineIsSelected)//if line is not selected do this.
    {
      if (line.IsOver == true) // If we are over the point and we click
        {
          if (keyPressed)
          {
            if(keyCode ==SHIFT)
            {line.IsSelected = true;}
          }
        }
      }

      else
      {              
        if (keyPressed)
        {
          if (keyCode != SHIFT) // if we are not holding shift
            {
              line.IsSelected = false;         
            }
        }
      else
      {
        AddMidPoint(line);
        line.IsSelected = false;        
      }
      
    }
  }      
}
 
void AddMidPoint(Line line)//This function finds where the new point should be injected in the pointarray and injects it.
{  
  if(line.IsSelected)
  {
    Vertex pivPoint;
    Vertex midPoint = new Vertex(mouseX,mouseY);
    int newIndex = 0;
    
    if(line.point1.ID > line.point2.ID)
    {pivPoint = line.point1;}
    else
    {pivPoint = line.point2;}
    
    for(int i = 0; i<PointArray.size(); i++)
    {
      if(PointArray.get(i).ID == pivPoint.ID)
      {
        newIndex = i;
        break;
      }
    }
    
    if(newIndex == PointArray.size()-1)
    {AppendPoint();}
    
    else
    {
      midPoint.ID = PointArray.get(newIndex).ID;    
      PointArray.add(newIndex,midPoint);
      
      for(int i = newIndex+1; i<PointArray.size(); i++)//Adjests all point IDs
      {PointArray.get(i).ID++;}
    }
    
    newPoint = true;
    line.IsSelected = false;    
  }
}

void DeletePoint(Vertex point)
{
  int index = PointArray.size()-1;
  
  for(int i = 0; i<PointArray.size(); i++)
  {
    if(PointArray.get(i).ID == point.ID)
    {
      index = i;
      break;
    }     
  }
  
  for(int i = index+1; i<PointArray.size(); i++)
  {
    PointArray.get(i).ID--;     
  }  
  
  PointArray.remove(index);    
  newPoint = true;
}
 
boolean a_line_is_selected()
{
  for(int i = 0; i< LineArray.size(); i++)
  {
    if(LineArray.get(i).IsSelected)
    {return true;}
  } 
  return false;
}

void AppendPoint()//Adds point at the end of the point list
{
  Vertex point = new Vertex(mouseX,mouseY);
  if(PointArray.size() >0)
  {point.ID = PointArray.get(PointArray.size()-1).ID+1;}
  PointArray.add(point);
}
 
 
 
 