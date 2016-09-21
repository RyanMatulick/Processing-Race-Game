ArrayList<Vertex> PointArray = new ArrayList<Vertex>();
ArrayList<Line> LineArray = new ArrayList<Line>();
Polygon Poly;
boolean newPoint;

void setup()
{
  background(255);
  size(600,600);
  frameRate(120);
  
  newPoint = false;
  
  cxpos = 450;
  cypos = 420;
  orbitRadius = 660;
  CamMoveSpeed = 3;
  
  for (int i = 0; i<KeyPress.length; i++)
  {
   KeyPress[i] = false; 
  }
  
  
  //noCursor();
  MakeGrid();
}


void draw()
{
  background(255);
  fill(0);
  //MyCamera();
  GetKeyPresses();
  DrawCursor();
  
  Poly = new Polygon(PointArray);
  //Poly.display();
  mouseHover();
  //LineArray.clear();
    
  
  // For All Points
  for (int i = 0; i< PointArray.size(); i++)
  {
    Vertex Point = PointArray.get(i);
    Point.plot();
    text(Point.ID,10,10+10*i);
    if (Point.IsSelected == true)
    {
     text("SELECTED",20,10+10*i); 
    }
    else if(Point.IsOver == true)
    {
     text("OVER",20,10+10*i); 
    }
  }
    
  if(PointArray.size() >2 && newPoint == true)
  {
      
      if(LineArray.size() >= 2)
      { 
        GLID--; 
        LineArray.set(LineArray.size()-1, new Line(PointArray.get(PointArray.size()-3),PointArray.get(PointArray.size()-2)));
        LineArray.add(new Line(PointArray.get(PointArray.size()-2),PointArray.get(PointArray.size()-1)));
      }
      
      else if(LineArray.size() == 1)
      {
        LineArray.add(new Line(PointArray.get(PointArray.size()-3),PointArray.get(PointArray.size()-2)));
        LineArray.add(new Line(PointArray.get(PointArray.size()-2),PointArray.get(PointArray.size()-1)));
      }
      
      else
      {LineArray.add(new Line(PointArray.get(PointArray.size()-3),PointArray.get(PointArray.size()-2)));}
      newPoint = false;

  }
  
  for (int i = 0; i< LineArray.size(); i++)
  {
    Line line = LineArray.get(i);
    
    LineArray.get(i).CheckOnLine();
    
    text(line.ID,100,10+10*i);
    LineArray.get(i).Display();
    if (line.IsSelected == true)
    {
     text("SELECTED",110,10+10*i); 
    }
    else if(line.IsOver == true)
    {
     text("OVER",110,10+10*i); 
    }
  }
  
  text(PointArray.size(),180,50);
  text(LineArray.size(),180,60);
    
}