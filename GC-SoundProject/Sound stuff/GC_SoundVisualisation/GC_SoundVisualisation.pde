enum ApplicationState
{
  MainMenu, DynamicVis
  
}
ApplicationState status;

ArrayList <Button> ButtonList = new  ArrayList <Button>() ;
void setup()
{
  
  //fullScreen(P2D);
  size(1000,800,P2D);
  status = ApplicationState.MainMenu;
  ButtonList.add(new Button(width-300,200,100,100));
  
  
  EnterMenu = false;
  EnterDynamicVis = false;
  
  // If the Buffersize is larger than the FFT Size, the FFT will fail
  // so we set Buffersize equal to bands
  device = new AudioDevice(this, 44000, bands);
  
  // Setup KeyArray
  for (int i = 0; i<KeyPress.length; i++)
  {
   KeyPress[i] = false; 
  }
  frameRate(120);
}

void draw()
{
  
 // DisplayMainMenu();
  
  GetKeyPresses();
  switch(status)
  {
   case MainMenu: DisplayMainMenu(); break;
   case DynamicVis: DisplayDynamicVis(); break; 
  }
  
}