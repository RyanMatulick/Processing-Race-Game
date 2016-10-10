ArrayList<Vertex> PointArray = new ArrayList<Vertex>();
ArrayList<Line> LineArray = new ArrayList<Line>();
Polygon Poly;
boolean newPoint; //Globally announces is a new point was added.

void setup()
{
  background(255);
  size(600,600);
  frameRate(120);
  MakeGrid();
  
  newPoint = false;
  
  for (int i = 0; i<KeyPress.length; i++)
  {
   KeyPress[i] = false; 
  }
}


void draw()
{  
///////////////////////////////////////////Update//////////////////////////////////////////////////////////  
//------------------------------Update Interface---------------------------------------------------------//

  background(255);
  fill(0);  
  GetKeyPresses();
  DrawCursor();  
  mouseHover();

//------------------------------Update Ploygon---------------------------------------------------------//

  Poly = new Polygon(PointArray);

//-------------------------------Update Points---------------------------------------------------------//  

  for (int i = 0; i< PointArray.size(); i++)
  {
    PointArray.get(i).update();
  }
  
//-------------------------------Update Lines-----------------------------------------------------------// 
  
  for (int i = 0; i< LineArray.size(); i++)
  {
    LineArray.get(i).update();
  }
  
//////////////////////////////////////////////////////////////////////////////////////////////////////////
  
//////////////////////////////////////////Display//////////////////////////////////////////////////////////  
//------------------------------Display Ploygon----------------------------------------------------------//
  //Poly.display();
  
//-------------------------------Display Points---------------------------------------------------------//  

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
  
//------------------------------Display Lines-----------------------------------------------------------// 
  
  for (int i = 0; i< LineArray.size(); i++)
  {
    Line line = LineArray.get(i);
    
    line.Display();
    
    text(line.ID,100,10+10*i);
    
    if (line.IsSelected == true)
    {
     text("SELECTED",110,10+10*i); 
    }
    
    else if(line.IsOver == true)
    {
     text("OVER",110,10+10*i); 
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////
  
/////////////////////////////////None direct Object Update and Display///////////////////////////////////
//-----------------------Adds new line when a new point is created--------------------------------------//  
  if(PointArray.size() >0 && newPoint == true)
  {
    LineArray.clear();
    GLID = 0;
    
    for(int i = 0; i < PointArray.size()-1; i++)
    {
      LineArray.add(new Line(PointArray.get(i),PointArray.get(i+1)));
    }
    
    LineArray.add(new Line(PointArray.get(PointArray.size()-1),PointArray.get(0)));
    newPoint = false;
  }
//---------------Display Generic Text for debug----------------------------------------------------------//  
  text(PointArray.size() + " points",180,50);
  text(LineArray.size()+ " lines",180,60);
//////////////////////////////////////////////////////////////////////////////////////////////////////////
}

/*
void delete_all_selected_points()
{
  for(int i = 0; i<PointArray.size(); i++)
  {
    if(PointArray.get(i).IsSelected)
    {PointArray.remove(i);}
  }
  
  for(int i = 0; i<PointArray.size(); i++)
  {PointArray.get(i).ID = i;}
  
  newPoint = true;
}
*/