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
  
  
  DrawCursor();
  
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