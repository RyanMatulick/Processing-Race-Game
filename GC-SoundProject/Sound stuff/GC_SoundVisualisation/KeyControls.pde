char [] Keys = {'m','n','f','g'};
Boolean [] KeyPress = new Boolean[20];


void GetKeyPresses()
{
  if(KeyPress[0])
  {
    if(Dynasmooth_factor< 1.98)
    {
      Dynasmooth_factor += 0.01;  //cap at 2
    }
  }
  if(KeyPress[1])
  {
    if(Dynasmooth_factor> 0.02)
    {
       Dynasmooth_factor -= 0.01; // cap at 0.01
    }
   
  }
  if(KeyPress[3] == true) // g
  {
    if (Sscale >=0)
    {
      Sscale -= 0.05;
    }
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