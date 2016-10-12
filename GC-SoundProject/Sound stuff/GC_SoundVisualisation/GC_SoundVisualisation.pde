enum ApplicationState
{
  MainMenu, DynamicVis, DynamicSpiral, DynamicRainbowWaves
  
}
ApplicationState status;

ArrayList <Button> ButtonList = new  ArrayList <Button>() ;
void setup()
{
  
  fullScreen(P2D);
  //size(1000,700,P2D);
  status = ApplicationState.DynamicVis;
  
  ButtonList.add(new Button(width-150,200,100,100,"  Dynamic \nVisualisation"));
  ButtonList.add(new Button(width-150,400,100,100,"  Dynamic \nSpiral"));
  ButtonList.add(new Button(width-150,600,100,100,"  Dynamic \nRainbowWaves"));
  
  
  EnterMenu = false;
  EnterDynamicVis = false;
  EnterRainbowWavesVis = false;
  EnterDynamicSpiralVis = false;
  
  
  // Setup KeyArray
  for (int i = 0; i<KeyPress.length; i++)
  {
   KeyPress[i] = false; 
  }
  frameRate(60);
  
}

void draw()
{
  
 // DisplayMainMenu();
  
  GetKeyPresses();
  
  switch(status)
  {
   case MainMenu:
             DisplayMainMenu(); 
             DrawSideBar();
             break;
   case DynamicVis: 
             DisplayDynamicVis(); 
             DrawSideBar();
             break; 
   case DynamicSpiral: 
             DrawSideBar();
             DisplayDynamicSpiral(); 
             
             break;
   case DynamicRainbowWaves:
             DrawSideBar();
             DisplayRainbowWaves();  
             break;
  }
  
  
  
  
  
  
}