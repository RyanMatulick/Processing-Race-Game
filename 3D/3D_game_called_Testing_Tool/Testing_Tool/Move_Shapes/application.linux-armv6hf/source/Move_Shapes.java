import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Move_Shapes extends PApplet {

ArrayList<Vertex> PointArray = new ArrayList<Vertex>();
ArrayList<Line> LineArray = new ArrayList<Line>();
Polygon Poly;
boolean newPoint; //Globally announces is a new point was added.

public void setup()
{
  background(255);
  
  frameRate(120);
  MakeGrid();
  
  newPoint = false;
  
  for (int i = 0; i<KeyPress.length; i++)
  {
   KeyPress[i] = false; 
  }
}


public void draw()
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
PShape Grid;
int GridSize = 30;
float NumOfGridLinesW;
float NumOfGridLinesH;


public void MakeGrid()
{
  
  NumOfGridLinesW = (width/GridSize);
  NumOfGridLinesH = (height/GridSize);
  strokeWeight(1);
  stroke(120);
  Grid = createShape();
  Grid.beginShape();
  for (int i = 0; i< NumOfGridLinesW; i++) // Draw Vertical Lines
  {
    if (i%2 ==0)
    {
      Grid.vertex(GridSize+GridSize*i,-1);
      Grid.vertex(GridSize+GridSize*i,height);
    }
    else
    {
      Grid.vertex(GridSize+GridSize*i,height);
      Grid.vertex(GridSize+GridSize*i,-1);
    }
  }
  for (int i = 0; i< NumOfGridLinesH; i++) // Draw Horizontal Lines
  {
    if (i%2 ==0)
    {
      Grid.vertex(-1,GridSize*i -1);
      Grid.vertex(width,GridSize*i -1);
    }
    else
    {
      Grid.vertex(width,GridSize*i -1);
      Grid.vertex(-1,GridSize*i -1);
    }
  }
  Grid.endShape();
}

public void DrawGrid()
{
  pushMatrix();
  shape(Grid); // display shape
  popMatrix();
}

public void Gridsnap()
{
  for (int i = 0; i< NumOfGridLinesW; i++) // Width
  {
    if (mouseX < GridSize+GridSize*i+(GridSize/2) && mouseX >= GridSize+GridSize*i-(GridSize/2))
    {
      MyMouseX = GridSize+GridSize*i;
    }
  }
  for (int i = 0; i< NumOfGridLinesH; i++) // Height
  {
    if (mouseY < GridSize+GridSize*i+(GridSize/2) && mouseY >= GridSize+GridSize*i-(GridSize/2))
    {
      MyMouseY = GridSize+GridSize*i-1;
    }
  }
}
  
  
//Cursor Stuff
int MyMouseX;
int MyMouseY;  
  
public void DrawCursor()
{
   if(IsGrid)
  {
    DrawGrid();
    Gridsnap();
  }

  else 
  {
    MyMouseX = mouseX;
    MyMouseY = mouseY;
  } 
  
  stroke(0);
  strokeWeight(5);
  point(MyMouseX,MyMouseY); 
}
  
  
char [] Keys = {'g'};
Boolean [] KeyPress = new Boolean[20];

public void GetKeyPresses()
{  
  if(KeyPress[0] == true) //template  
  {}  
}

//--------------------------------------------------
// Don't Need To Touch
//--------------------------------------------------
boolean IsGrid = false;
boolean Gridtoggle = false;


public void keyPressed() // define what happens when specific keys are pressed
{

  for (int i = 0; i< Keys.length; i++)
  {
    if(key == Keys[i])
      KeyPress[i] = true;
  }
  if(key == 'g' && !Gridtoggle)
  {
    IsGrid=!IsGrid;
    Gridtoggle=true;
  }
 
}
  
public void keyReleased() // needed for multi touch controls
{
  for (int i = 0; i< Keys.length; i++)
  {
    if(key == Keys[i])
      KeyPress[i] = false;
  }
   if(key == 'g')
  {
    Gridtoggle=false;
  }
}
static int GLID = 0;
class Line
{
  Vertex point1;
  Vertex point2;
  
  float Slope;
  float C;
  float EQx;
  float EQy;
  
  boolean IsOver;
  boolean IsSelected;
  
  int ID;
  int R;
  int G;
  int B;
  Line(Vertex p1, Vertex p2)
  {
    GenerateEquationFactors(p1, p2);
    IsOver = false;
    IsSelected = false;
    R = 255;
    G = 0;
    B = 0;
    ID = GLID++;
  }
  
  public void Display()
  {
   stroke(R,G,B);
   strokeWeight(1);
   line(point1.x,point1.y,point2.x,point2.y);  
  }
  
  public void update()
  {
    CheckOnLine();

    if(IsSelected)
    {
      point1.IsSelected = true;
      point2.IsSelected = true;
      R = 255;
      G = 0;
      B = 255;
    }
    else if(IsOver) 
    {
      R = 0;
      G = 255;
      B = 0;
    }
 
    if (keyPressed && key == 'l' && IsSelected) // if we are not holding shift
    {IsSelected = false;}
  }
  
  public void GenerateEquationFactors(Vertex p1, Vertex p2)
  {
    point1 = p1;
    point2 = p2;
    Slope = (point2.y-point1.y)/(point2.x-point1.x);
    C = point1.y - Slope*point1.x;
  } //<>// //<>//
  
  public boolean CheckinLineDomain(boolean realSlope) //check to see if the mosue cursor is with in the lines domain
  {
    float x1r, x2r, y1r, y2r; //Line restraints 
    
    if(point1.x > point2.x)
    {x1r = point2.x; x2r = point1.x;}
    else
    {x2r = point2.x; x1r = point1.x;}
    
    if(point1.y > point2.y) 
    {y1r = point2.y; y2r = point1.y;}
    else
    {y2r = point2.y; y1r = point1.y;}
    
    if(realSlope)
    {
      if(Slope != 0)
      {        
        if(mouseX > x1r && mouseX < x2r && mouseY > y1r && mouseY < y2r)
        {return true;}
        else
        {return false;}
      }
      
      else
      {
        if(mouseX > x1r && mouseX < x2r)
        {return true;}
        else
        {return false;}
      }
    }
    else
    {
      if(mouseY > y1r && mouseY < y2r)
      {return true;}
      else
      {return false;}    
    }
  }
  
  public boolean CheckifRealSlope()// checks to see if the line's slope is not undefined
  {
    if(point2.x-point1.x != 0)
    {            
      return true;
    }
    
    else
    {return false;}
  }
  
  public void CheckOnLine()
  { 
    if(CheckifRealSlope())
    {EQy = (Slope*mouseX) + C; EQx = (mouseY - C)/Slope;}
  
    if (((mouseX >= EQx-7 && mouseX <= EQx+7) || (mouseY > EQy-7 && mouseY < EQy+7)) && CheckifRealSlope() && CheckinLineDomain(CheckifRealSlope()))
    {     
      R = 0;
      G = 255;
      IsOver = true;
    }
    
    
    else if(point2.x-point1.x == 0)
    {
      if (mouseX >= point1.x-7 && mouseX <= point1.x+7 && CheckinLineDomain(CheckifRealSlope()))
      {
        R = 0;
        G = 255;
        B = 0;
        IsOver = true;
      }
      
      else
      {
        R = 255;
        G = 0;
        B = 0;
        IsOver = false;
      }
    }    
    
    else
    {
      R = 255;
      G = 0;
      B = 0;
      IsOver = false;
    }
  }  
}
public void mouseHover()
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
public void mousePressed()
{
  ClickPoint();
  ClickLine();
} 
 
 
public void ClickPoint()
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
 
 
public void ClickLine()
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
 
public void AddMidPoint(Line line)//This function finds where the new point should be injected in the pointarray and injects it.
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

public void DeletePoint(Vertex point)
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
 
public boolean a_line_is_selected()
{
  for(int i = 0; i< LineArray.size(); i++)
  {
    if(LineArray.get(i).IsSelected)
    {return true;}
  } 
  return false;
}

public void AppendPoint()//Adds point at the end of the point list
{
  Vertex point = new Vertex(mouseX,mouseY);
  if(PointArray.size() >0)
  {point.ID = PointArray.get(PointArray.size()-1).ID+1;}
  PointArray.add(point);
}
 
 
 
 
class Polygon
{
  PShape Poly;
  Polygon(ArrayList<Vertex> Points) // Make Polygon
  {
   Poly = createShape();
   Poly.setStroke(color(0,0,255));
   Poly.setFill(color(120,0,120));
   Poly.beginShape();
   for(int i = 0; i<Points.size(); i++)
   {
     Poly.vertex(Points.get(i).x,Points.get(i).y);
   }
   Poly.endShape(CLOSE);
  }
  
  public void display()
  {   
   pushMatrix();
   shape(Poly);
   popMatrix();
  }
  
}
class Vertex
{
 int ID;
 float x;
 float y;
 int R;
 int B;
 int G;
 boolean IsOver;
 boolean IsSelected;
  Vertex(float tempX, float tempY)
  {
    x = tempX;
    y = tempY;
    R = 0;
    B = 0;
    G = 0;
    IsOver = true;
    IsSelected = false;
  }
 
  public void plot()
  {
    strokeWeight(5);
    stroke(R,G,B);
    point(x,y);   
  }
  
  public void update()
  {
    if(IsSelected)
    {
      R = 0;
      G = 255;
      B = 0;
    }
    
    else if(IsOver) 
    {
      R = 0;
      G = 255;
      B = 255;
    }
    
    else
    {
      R = 0;
      G = 0;
      B = 0;
    }
    
    if (keyPressed && key == 'p' && IsSelected) // if we are not holding shift
    {IsSelected = false;}
    
  }
}
  public void settings() {  size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Move_Shapes" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
