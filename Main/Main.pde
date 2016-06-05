//Initialisers
float Threshold;
//tracks
int ellipse1x;
int ellipse2x;
int ellipsey;
int ellipseSize;
float r; // radius of circle the car follows
float R; // Temperary radius for current vehicle
int K; //index of Car that Caused Crash
int NumofCars; // number of cars in game
int score1;
int score2;

boolean DebugMode; // used for testing and visualising values
boolean Crash; // Has someone crashed?
boolean Car1Score; // If Player 1 is on score line
boolean Car2Score; // If PLayer 2 is on score line

Car [] CarArray = new Car[4];
void setup()
{
  DebugMode = false;
  size(800,600);
  frameRate(60);  
  mySetup(); // initilisation of all variables
}

void draw()
{
  background(50,185,0); // redraw background
  DrawBackground(CarArray[0],CarArray[1]); // draw everything that isn't a car
  
  // Update the speed of The 2 Players based on Boost
  UpdatePlayerSpeed(CarArray[0]);
  UpdatePlayerSpeed(CarArray[1]);
  
  Threshold +=0.4; // Timer to increase Base Speeds
  
  if(Threshold >= 10 && CarArray[0].getBaseSpeed() <70) // Update Base Speed of all cars
  {
    CarArray[3].setSpeed(CarArray[3].getSpeed() + 1.2); // NPC's speed change at different rates
    CarArray[2].setSpeed(CarArray[2].getSpeed() + 1.1);
    CarArray[1].setBaseSpeed(CarArray[1].getBaseSpeed() + 1);
    CarArray[0].setBaseSpeed(CarArray[0].getBaseSpeed() + 1);
    Threshold = 0;
  }
  
  // Update Car Positions
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
    DrawCar(CarArray[i]); // Draw Cars
  }
  
  UpdateScore(); // check if a player crosses line
 
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



void keyPressed() // define what happens when specific keys are pressed
{
  if(key== CarArray[0].getControl())
    CarArray[0].KeyPressed = true;
  if(key==CarArray[1].getControl())
    CarArray[1].KeyPressed=true;
}
  
  void keyReleased() // needed for multi touch controls
{
  if(key==CarArray[0].getControl())
    CarArray[0].KeyPressed=false;
  if(key==CarArray[1].getControl())
    CarArray[1].KeyPressed=false;
}