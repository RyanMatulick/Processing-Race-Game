char [] Keys = {'g'};
Boolean [] KeyPress = new Boolean[20];

void GetKeyPresses()
{  
  if(KeyPress[0] == true) //template  
  {}  
}

//--------------------------------------------------
// Don't Need To Touch
//--------------------------------------------------
boolean IsGrid = false;
boolean Gridtoggle = false;


void keyPressed() // define what happens when specific keys are pressed
{

  for (int i = 0; i< Keys.length; i++)
  {
    if(key == Keys[i])
      KeyPress[i] = true;
  }
  if(key == 'g' && !Gridtoggle)
  {
    IsGrid=!IsGrid;
    Gridtoggle=true;
  }
 
}
  
void keyReleased() // needed for multi touch controls
{
  for (int i = 0; i< Keys.length; i++)
  {
    if(key == Keys[i])
      KeyPress[i] = false;
  }
   if(key == 'g')
  {
    Gridtoggle=false;
  }
}