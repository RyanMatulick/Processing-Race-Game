void keyPressed() // define what happens when specific keys are pressed
{
  if(key == 'w') // Move Up
  {
    KeyPress[0] = true;
  }
  if(key == 's') // Move down
  {
    KeyPress[1] = true;
  }
  if(key == 'a') // Move Left
  {
    KeyPress[2] = true;
  }
  if(key == 'd') // Move Right
  {
    KeyPress[3] = true;
  }
  if(key == 'i') // Orbit Up
  {
    KeyPress[4] = true;
  }
  if(key == 'k') // Orbit down
  {
    KeyPress[5] = true;
  }
  if(key == 'j') // Orbit Left
  {
    KeyPress[6] = true;
  }
  if(key == 'l') // Orbit Right
  {
    KeyPress[7] = true;
  }
  if(key == 'r') // Orbit Right
  {
    KeyPress[8] = true;
  }
  if(key == 'z') // Orbit Right
  {
    KeyPress[9] = true;
  }
  if(key == 'x') // Orbit Right
  {
    KeyPress[10] = true;
  }
}
  
void keyReleased() // needed for multi touch controls
{
  if(key == 'w')// Move Up
  {
    KeyPress[0] = false;
  }
  if(key == 's') // Move down
  {
    KeyPress[1] = false;
  }
  if(key == 'a') // Move Left
  {
    KeyPress[2] = false;
  }
  if(key == 'd') // Move Right
  {
    KeyPress[3] = false;
  }
  if(key == 'i') // Orbit Up
  {
    KeyPress[4] = false;
  }
  if(key == 'k') // Orbit down
  {
    KeyPress[5] = false;
  }
  if(key == 'j') // Orbit Left
  {
    KeyPress[6] = false;
  }
  if(key == 'l') // Orbit Right
  {
    KeyPress[7] = false;
  }
  if(key == 'r') // Orbit Right
  {
    KeyPress[8] = false;
  }
  if(key == 'z') // Orbit Right
  {
    KeyPress[9] = false;
  }
  if(key == 'x') // Orbit Right
  {
    KeyPress[10] = false;
  }
}