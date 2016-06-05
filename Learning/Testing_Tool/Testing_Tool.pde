Vehicle truck;
BasicShape Track;
BasicShape InsideTrack;

void setup() 
{
  size(500, 500, P3D);
  mySetup();
  DebugMode = true;
  LRrotation = 0;
  UDrotation = 0;
  orbitRadius = 550;
  CamMoveSpeed = 3;
  
  for (int i = 0; i<KeyPress.length; i++)
  {
   KeyPress[i] = false; 
  }
  Track = new BasicShape(20, r+60, 20);
  InsideTrack = new BasicShape(20,r-30,30);
  frameRate(120);
}


void draw()
{
  background(255);
  lights();

  MyCamera();
  GetKeyPresses();
  
  DrawBackground();
  
  // Update the speed of The 2 Players based on Boost
  UpdatePlayerSpeed(CarArray[0]);
  UpdatePlayerSpeed(CarArray[1]);
  
  Threshold +=0.1; // Timer to increase Base Speeds
  
  if(Threshold >= 10 && CarArray[0].getBaseSpeed() <70) // Update Base Speed of all cars
  {
    CarArray[3].setSpeed(CarArray[3].getSpeed() + 0.6); // NPC's speed change at different rates
    CarArray[2].setSpeed(CarArray[2].getSpeed() + 0.55);
    CarArray[1].setBaseSpeed(CarArray[1].getBaseSpeed() + 0.5);
    CarArray[0].setBaseSpeed(CarArray[0].getBaseSpeed() + 0.5);
    Threshold = 0;
  }
  
  
  for (int i = 0; i<NumofCars; i++)
  {
    if (i%2 == 0)
    {
      R = r + 30; // place car in outside lane
    }
    else
    {
      R = r - 10; // place car on inside lane
    }
    if (Crash == false) //Do not update the car positions if we have crashed
    {
      CarArray[i].setT(CarArray[i].getT() + CarArray[i].getSpeed()/1000); // T = (T + Speed/1000)
      CarArray[i].setX((int)(CarArray[i].getCX()+R*cos(CarArray[i].getT()))); // X = (CX+r*cos(T))
      CarArray[i].setY((int)(CarArray[i].getCY()+R*sin(CarArray[i].getT()))); // Y = (CY+r*cos(T))
    }
    CarArray[i].display(); // Draw Cars
  }
  
  for (int i = 0; i < 2; i ++) // number of players
  {
    for (int j = 0; j < NumofCars - 2; j++) // Num of enemies
    {
      if (Crash == false) // if we have not crashed before
      {
        Crash = FindCollision(CarArray[i],CarArray[j+2]);
         K = i; // saves the player that crashed
      }
      if (Crash == true) // if we are currently crashed
      {
        if (DebugMode == true)
        {
          fill(255);
          text("CRASH",10,40);
        }
        if (K == 0)
        {
          text("Player 1 Crashed!!",330,440);
          score1 -= 5;
        }
        else
        {
          text("Player 2 Crashed!!",330,440);
          score2 -= 5;
        }
        
        break; // break out of loop
      }
    }
  }
  if (Crash == true|| DebugMode == true)
  {
    Reset(); // reset the game
  }
  
}