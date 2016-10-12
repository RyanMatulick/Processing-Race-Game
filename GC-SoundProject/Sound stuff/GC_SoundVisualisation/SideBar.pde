
void DrawSideBar()
{
  for (int i = 0; i< ButtonList.size(); i++)
  {
    ButtonList.get(i).Display();  
  }
  
  if(ButtonList.get(0).bisActive)
  {
    status = ApplicationState.DynamicVis;  
    ButtonList.get(0).bisActive = false;
   
  }
  if(ButtonList.get(1).bisActive)
  {
    status = ApplicationState.DynamicSpiral;  
    ButtonList.get(1).bisActive = false;
   
  }
  if(ButtonList.get(2).bisActive)
  {
    status = ApplicationState.DynamicRainbowWaves;  
    ButtonList.get(2).bisActive = false;
  
  }
}
  
  
  
  
  
  // Button Class
Button LineButton;
class Button
{
  float ButtonX;
  float ButtonY;
  float FButtonX;
  float FButtonY;
  float ButtonWidth;
  float ButtonHeight;
  float FButtonWidth;
  float FButtonHeight;
  
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
    FButtonX = xpos;
    FButtonY = ypos;
    FButtonWidth = Width;
    FButtonHeight = Height;
    bisActive = false;
    bisOver = false;
    text = itext;
    isOver = false;
  }
  void Display()
  {
    
    getFill();
    Jiggle();
    colorMode(RGB);
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
      
        ButtonWidth = FButtonWidth + FButtonWidth/4;  
        ButtonX = FButtonX - FButtonWidth/8;
        ButtonHeight = FButtonHeight+ FButtonHeight/4;  
        ButtonY = FButtonY - FButtonHeight/8;
   
    }
    else
    {
     
        ButtonWidth = FButtonWidth; 
        ButtonX = FButtonX;
        ButtonY = FButtonY;
        ButtonHeight = FButtonHeight;  
      
      
    }
  }
}


void mouseClicked()
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