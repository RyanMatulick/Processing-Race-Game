boolean EnterMenu;

void DisplayMainMenu()
{
  background(255);
  if (EnterMenu == false)
  {
    FFTBarsSetup();  
    EnterMenu = true;
  }
  FFTMenuBars();
  
  for (int i = 0; i< ButtonList.size(); i++)
  {
    ButtonList.get(i).Display();  
  }
  
}


// Button Class
Button LineButton;
class Button
{
  float ButtonX;
  float ButtonY;
  float ButtonWidth;
  float ButtonHeight;
  int R;
  int G;
  int B;
  boolean bisActive;
  int isActive;
  boolean bisOver;
  boolean isOver;
  String text;
  Button(float xpos, float ypos, float Width, float Height, String itext)
  {
    ButtonX = xpos;
    ButtonY = ypos;
    ButtonWidth = Width;
    ButtonHeight = Height;
    bisActive = false;
    bisOver = false;
    text = itext;
    isOver = false;
  }
  void Display()
  {
    
    getFill();
    Jiggle();
    fill(R,G,B);
    rect(ButtonX,ButtonY,ButtonWidth,ButtonHeight);
    fill(0);
    text(text,ButtonX+ButtonWidth/3,ButtonY+ButtonHeight/3);
  }
  
  void getFill()
  {
    R = G = B = 255;
    bisOver = false;
    if (mouseX > ButtonX && mouseX < ButtonX + ButtonWidth)
    {
      if (mouseY > ButtonY && mouseY < ButtonY+ButtonHeight)
      {
        R = 250;
        G = 150;
        B = 150;
        bisOver = true;
      
      }
    }
    if (bisActive)
    {
      R = 100;
      G = 200;
      B = 100;
    }
  }
  void Jiggle()
  {
    if(bisOver)
    {
      if(isOver == false)
      {
        ButtonWidth += ButtonWidth/4;  
        //ButtonX -= ButtonWidth/8;
        ButtonHeight += ButtonHeight/4;  
        //ButtonY -= ButtonHeight/8;
      }
      isOver = true;
    }
    else
    {
      if (isOver)
      {
        ButtonWidth -= ButtonWidth/4; 
        //ButtonX += ButtonWidth/8;
        ButtonHeight -= ButtonHeight/4;  
        //ButtonY += ButtonHeight/8;
      }
      isOver = false;
    }
  }
}


void mousePressed()
{
  for(int i = 0; i< ButtonList.size(); i++)
  {
    if (ButtonList.get(i).bisOver == true)
    {
      if (ButtonList.get(i).bisActive == true)
      {
        ButtonList.get(i).bisActive = false;
      }
      else
      {
        ButtonList.get(i).bisActive = true;       
      }
    }
  }
}