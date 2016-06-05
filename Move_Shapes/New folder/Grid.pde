PShape Grid;
int GridSize = 30;
float NumOfGridLinesW;
float NumOfGridLinesH;




void MakeGrid()
{
  
  NumOfGridLinesW = (width/GridSize);
  NumOfGridLinesH = (height/GridSize)+1;
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

void DrawGrid()
{
  pushMatrix();
  shape(Grid); // display shape
  popMatrix();
}

void Gridsnap()
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
  
void DrawCursor()
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
  
  