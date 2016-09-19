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

Vehicle [] CarArray = new Vehicle[4];


void mySetup()
{
    cxpos = 450;
    cypos = 420;
    orbitRadius = 660;
  
    Crash = false;
    K = -1;
    Threshold = 0;
    NumofCars = 4;
    score1 = 0;
    score2 = 0;
    //for Tracks
    ellipse1x = 300;
    ellipse2x = 600;
    ellipsey = 300;
    ellipseSize = 3*width/8;
    r = 200;
    
    //For playerCar
    CarArray[0] = new Vehicle(ellipse1x,ellipsey,10);
    CarArray[0].setControl('t');
    CarArray[1] = new Vehicle(ellipse1x,ellipsey,10);
    CarArray[1].setControl('y');
     //For Non-player car
    CarArray[2] = new Vehicle(ellipse2x,ellipsey,10);
    CarArray[3] = new Vehicle(ellipse2x,ellipsey,10);
}

void Reset()
{
  if (keyPressed) 
  {
    if (key == 'r') 
       {
         mySetup();
       }
  }
}