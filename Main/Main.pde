//Initialisers
float Threshold;
//tracks
int ellipse1x;
int ellipse2x;
int ellipsey;
int ellipseSize;
float r; // variable used to place cars
int K;
int NumofCars;
int score;

boolean DebugMode;
boolean Crash;

Car [] CarArray = new Car[4];
void setup()
{
  DebugMode = true;
  size(800,600);//If not on web
  frameRate(60);  
    
    mySetup();
}

void draw()
{
  background(50,185,0);
  DrawBackground(CarArray[0],CarArray[1]);
  
  fill(255);
  if (Crash == false)
  {
  UpdatePlayerSpeed(CarArray[0]);
  UpdatePlayerSpeed(CarArray[1]);
  }
  if (DebugMode == false)
  {
    Threshold +=0.4; // Timer to increase Base Speeds
  }
  
  if(Threshold >= 10 && CarArray[0].getBaseSpeed() <70) // Update Base Speed
  {
    CarArray[3].setSpeed(CarArray[3].getSpeed() + 1.2);
    CarArray[2].setSpeed(CarArray[2].getSpeed() + 1.1);
    CarArray[1].setBaseSpeed(CarArray[1].getBaseSpeed() + 1);
    CarArray[0].setBaseSpeed(CarArray[0].getBaseSpeed() + 1);
    Threshold = 0;
  }
  // Update Car Positions
  for (int i = 0; i<NumofCars; i++)
  {
    float R;
    if (i%2 == 0)
    {
      R = r + 30;
    }
    else
    {
      R = r - 10; 
    }
    if (Crash == false)
    {
      CarArray[i].setT(CarArray[i].getT() + CarArray[i].getSpeed()/1000); // T = (T + Speed/1000)
    }
    CarArray[i].setX((int)(CarArray[i].getCX()+R*cos(CarArray[i].getT()))); // X = (CX+r*cos(T))
    CarArray[i].setY((int)(CarArray[i].getCY()+R*sin(CarArray[i].getT()))); // Y = (CY+r*cos(T))
    DrawCar(CarArray[i]); // Draw Car
  }
  
  if (FindScore(CarArray[0]) == true)// get collision with start line 
  {
      score++;
  } 
 
  for (int i = 0; i < 2; i ++)
  {
    for (int j = 0; j < 2; j++) 
    {
      if (Crash == false)
      {
        Crash = FindCollision(CarArray[i],CarArray[j+2]);
         K = i;
      }
      if (Crash == true)
      {
        if (DebugMode == true)
        {
          fill(255);
          text("CRASH",10,40);
        }
        if (K == 0)
        {
          text("Player 1 Crashed!!",330,440);
        }
        else
        {
          text("Player 2 Crashed!!",330,440);
        }
        
        break;
      }
    }
  }
  if (Crash == true|| DebugMode == true)
  {
    Reset();
  }
}

void keyPressed()
{
  if(key== CarArray[0].getControl())
    CarArray[0].KeyPressed = true;
  if(key==CarArray[1].getControl())
    CarArray[1].KeyPressed=true;
}
  
  void keyReleased()
{
  if(key==CarArray[0].getControl())
    CarArray[0].KeyPressed=false;
  if(key==CarArray[1].getControl())
    CarArray[1].KeyPressed=false;
}