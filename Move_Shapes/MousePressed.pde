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
            
            else if (Point.IsSelected && key == 'p') // if we are holding shift
            {
              DeletePoint(Point);
              break;
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
          Vertex temp = new Vertex(MyMouseX,MyMouseY,0);
          PointArray.add(point);
          PointArray.get(0).ID = 0;
          PointArray.add(temp);
          PointArray.get(1).ID = 1;
        }
  
        else if(PointArray.size()>=2)
        {
          PointArray.set(PointArray.size()-1,point);
          PointArray.get(PointArray.size()-1).ID = PointArray.size()-1;
          PointArray.add(new Vertex(PointArray.get(0).xpos, PointArray.get(0).ypos, PointArray.get(0).zpos));
          PointArray.get(PointArray.size()-1).ID = PointArray.size()-1;
        }
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
            if (key == 'o') // if we are pressing down 'o' key
            {
              line.IsSelected = true;
            }
          }
        }
      }

      else
      {              
        if (keyPressed)
        {
          if (key != 'o') // if we are not holding shift
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
    Vertex point;
    int newIndex = 0;
    
    if(line.p1.ID > line.p2.ID)
    {point = line.p1;}
    else
    {point = line.p2;}
    
    for(int i = 0; i<PointArray.size(); i++)
    {
      if(PointArray.get(i).ID == point.ID)
      {
        newIndex = i;
        break;
      }
    }
    
    PointArray.add(newIndex,new Vertex(mouseX,mouseY,0));
    PointArray.get(newIndex).ID = PointArray.get(newIndex-1).ID + 1;
    
    for(int i = ++newIndex; i<PointArray.size(); i++)
    {
      PointArray.get(i).ID++;
    }
  }
  
  newPoint = true;
  line.IsSelected = false;
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
 
 
 
 