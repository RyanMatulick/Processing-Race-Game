char [] Keys = {'m'};
Boolean [] KeyPress = new Boolean[20];

void GetKeyPresses()
{
  
  if(KeyPress[0] == true) // m
  {
    status = ApplicationState.MainMenu;
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