

void DisplayMainMenu()
{
  background(255);
  
  
  for (int i = 0; i< ButtonList.size(); i++)
  {
    ButtonList.get(i).Display();  
  }
}

// Button Class
Button LineButton;
class Button
{
  int ButtonX;
  int ButtonY;
  int ButtonWidth;
  int ButtonHeight;
  int R;
  int G;
  int B;
  boolean isActive;
  boolean isOver;
  Button(int xpos, int ypos, int Width, int Height)
  {
    ButtonX = xpos;
    ButtonY = ypos;
    ButtonWidth = Width;
    ButtonHeight = Height;
    isActive = false;
    isOver = false;
  }
  void Display()
  {
    getFill();
    fill(R,G,B);
    rect(ButtonX,ButtonY,ButtonWidth,ButtonHeight);
    fill(0);
    text("Line \nGraph",width-75,95);
  }
  
  void getFill()
  {
    R = G = B = 255;
    isOver = false;
    if (mouseX > ButtonX && mouseX < ButtonX + ButtonWidth)
    {
      if (mouseY > ButtonY && mouseY < ButtonY+ButtonHeight)
      {
        R = 250;
        G = 150;
        B = 150;
        isOver = true;
      
      }
    }
    if (isActive)
    {
      R = 100;
      G = 200;
      B = 100;
    }
  }
}


void mousePressed()
{
  for(int i = 0; i< ButtonList.size(); i++)
  {
    if (ButtonList.get(i).isOver == true)
    {
      if (ButtonList.get(i).isActive == true)
      {
        ButtonList.get(i).isActive = false;
      }
      else
      {
        ButtonList.get(i).isActive = true;       
      }
    }
  }
}