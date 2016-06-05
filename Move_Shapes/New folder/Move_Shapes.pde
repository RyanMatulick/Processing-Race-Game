Line line1;
Vertex point1;
Vertex point2;
ArrayList<Vertex> PointArray = new ArrayList<Vertex>();
ArrayList<Vertex> LinePoints = new ArrayList<Vertex>();
ArrayList<Line> LineArray = new ArrayList<Line>();
void setup()
{
  size(600,600);
  frameRate(120);
  //noCursor();
  MakeGrid();
  
}


void draw()
{
  background(255);
  fill(0);
  DrawCursor();
  
  
  
  mouseHover();
  LineArray.clear();
    
  
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
  
  
  if(LinePoints.size() >=2)
  {
    for(int j = 0; j < floor(LinePoints.size()/2); j++)
    {
      text(floor(LinePoints.size()/2),100,10);
      text(LinePoints.get(j).ID,100,20 + 10*j);
      text(LinePoints.get(j+1).ID,100,20 + 10*(j+1));
      LineArray.add(new Line(LinePoints.get(j),LinePoints.get(j+1)));
    } 
  }
  for (int i = 0; i< LineArray.size(); i++)
  {
    LineArray.get(i).Display();
  }
  text(LinePoints.size(),130,40);
  text(PointArray.size(),130,50);
  text(LineArray.size(),130,60);
  
}


boolean IsGrid = false;
boolean Gridtoggle = false;

void keyPressed() 
{
  if(key == 'g' && !Gridtoggle)
  {
    IsGrid=!IsGrid;
    Gridtoggle=true;
  }
}

void keyReleased() 
{
  if(key == 'g')
  {
    Gridtoggle=false;
  }
}