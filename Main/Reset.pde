void mySetup()
{
    Crash = false;
    K = -1;
    Threshold = 0;
    NumofCars = 4;
    //for Tracks
    ellipse1x = 3*width/8;
    ellipse2x = width - ellipse1x;
    ellipsey = height/3;
    ellipseSize = 3*width/8;
    r = (ellipseSize+(50))/PI + 20;
    
    //For playerCar
    CarArray[0] = new Car(ellipse1x,ellipsey,20);
    CarArray[0].setControl('w');
    CarArray[1] = new Car(ellipse1x,ellipsey,20);
    CarArray[1].setControl('i');
     //For Non-player car
    CarArray[2] = new Car(ellipse2x,ellipsey,20);
    CarArray[3] = new Car(ellipse2x,ellipsey,20);
}

void Reset()
{
  if (keyPressed) 
  {
    if (key == 'r' || key == 'R') 
       {
         mySetup();
       }
  }
}

void UpdatePlayerSpeed(Car Player)
{
    if(Player.KeyPressed == true)
    {
      Player.boost = Player.boost-1; // decrease Boost
      if (Player.boost<=0) // If Boost is depleted Boost is false
      { 
        Player.boost=0;
        Player.canBoost=false;
      }
      if ( Player.canBoost==true)
      {
        if ((Player.getSpeed() <= Player.getBaseSpeed()+40)) // if Player speed is less than max speed
        {
          Player.setSpeed(Player.getSpeed() +1.5); // Player Speed -> Max Speed
        }
      }
      else if (Player.getSpeed() > Player.getBaseSpeed())  // if mouse is pressed and Player Speed is Greater than Base Speed
      {
        Player.setSpeed(Player.getSpeed() - 2); // Decrease Player Speed -> Base Speed
      }
    } // end player move key
    else if (Player.getSpeed() > Player.getBaseSpeed()) // if mouse is not pressed and Player Speed is Greater than Base Speed
    {
      Player.setSpeed(Player.getSpeed() -2); // Decrease Player Speed -> Base Speed
    }
    else // if mouse is not pressed
    {
      Player.setSpeed(Player.getBaseSpeed());
      Player.canBoost=true; // We can now Boost again
      Player.boost++; // Add fuel Back
      if( Player.boost>100) // Make sure not to have too much fuel
      {
          Player.boost=100;
      }
    } 

}