char [] Keys = {'m','d','f','g'};
Boolean [] KeyPress = new Boolean[20];



void GetKeyPresses()
{
  
  if(KeyPress[0] == true) // m
  {
    if(EnterMenu == false)
    {
      sample.stop();
      //EnterDynamicVis = false;
      status = ApplicationState.MainMenu;
    }
  }
  
  if(KeyPress[1] == true) // d
  {
    if(EnterDynamicVis == false)
    {
      sample.stop();
      
      //EnterMenu = false;
      status = ApplicationState.DynamicVis;
    }
  }
  
  if(KeyPress[2] == true) // f
  {
    rotate_factor += 0.6;
  }
  
  if(KeyPress[3] == true) // g
  {
    rotate_factor -= 0.6;
  }
  
}

//--------------------------------------------------
// Don't Need To Touch
//--------------------------------------------------
void keyPressed() // define what happens when specific keys are pressed
{
 
  
  for (int i = 0; i< Keys.length; i++)
  {
    if(key == Keys[i])
      KeyPress[i] = true;
  }
  
  
}

void keyReleased() // needed for multi touch controls
{
  
  for (int i = 0; i< Keys.length; i++)
  {
    if(key == Keys[i])
      KeyPress[i] = false;
  }
  
}