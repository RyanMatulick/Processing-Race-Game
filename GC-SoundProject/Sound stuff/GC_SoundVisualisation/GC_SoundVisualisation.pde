enum ApplicationState
{
  MainMenu, DynamicVis
  
}
ApplicationState status;

ArrayList <Button> ButtonList = new  ArrayList <Button>() ;
void setup()
{
  
  //fullScreen(P2D);
  size(1000,800);
  status = ApplicationState.MainMenu;
  ButtonList.add(new Button(width-300,200,100,100));
}

void draw()
{
  DisplayMainMenu();
  /*
  GetKeyPresses();
  switch(status)
  {
   case MainMenu: DisplayMainMenu(); break;
   case DynamicVis: break; 
  }
  */
}