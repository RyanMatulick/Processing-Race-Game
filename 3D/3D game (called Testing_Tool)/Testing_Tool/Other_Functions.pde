void UpdatePlayerSpeed(Vehicle Player)
{
    if(Player.KeyPressed == true)
    {
      Player.boost = Player.boost-0.7; // decrease Boost
      if (Player.boost<=0) // If Boost is depleted Boost is false
      { 
        Player.boost = 0;
        Player.canBoost = false;
      }
      if ( Player.canBoost==true)
      {
        if ((Player.getSpeed() <= Player.getBaseSpeed()+15)) // if Player speed is less than max speed
        {
          Player.setSpeed(Player.getSpeed() +0.5); // Player Speed -> Max Speed
        }
      }
      else if (Player.getSpeed() > Player.getBaseSpeed())  // if mouse is pressed and Player Speed is Greater than Base Speed
      {
        Player.setSpeed(Player.getSpeed() - 0.7); // Decrease Player Speed -> Base Speed
      }
    } // end player move key
    else if (Player.getSpeed() > Player.getBaseSpeed()) // if mouse is not pressed and Player Speed is Greater than Base Speed
    {
      Player.setSpeed(Player.getSpeed() -0.7); // Decrease Player Speed -> Base Speed
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

void UpdateScore() // Updates for each player
{
 if(Car1Score == false)
  {
     if (FindScore(CarArray[0]) == true)// get collision with start line 
    {
      Car1Score = true;
      score1++;
    }
  } 
  else
  {
    if (FindScore(CarArray[0]) == false)// get collision with start line 
    {
      Car1Score = false;
    }
  }
  
  if(Car2Score == false)
  {
     if (FindScore(CarArray[1]) == true)// get collision with start line 
    {
      Car2Score = true;
      score2++;
    }
  } 
  else
  {
    if (FindScore(CarArray[1]) == false)// get collision with start line 
    {
      Car2Score = false;
    }
  }   
}