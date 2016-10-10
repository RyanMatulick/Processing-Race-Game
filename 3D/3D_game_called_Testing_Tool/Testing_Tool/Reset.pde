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

boolean DebugMode; // used for testing and visualising values
boolean Crash; // Has someone crashed?



Vehicle [] CarArray = new Vehicle[4];


void mySetup()
{
  if (PlayGame == true)
  {
    cxpos = width/2;
    cypos = height/2;
    czpos = 0;
    
    orbitRadius = 780;
    UDrotation = 90;
    LRrotation = -5;
  }
  else
  {
    cxpos = width/2;
    cypos = height/2;
    czpos = 0;
    
    orbitRadius = 650;
    UDrotation = 90;
    LRrotation = 64;
  }
  
    Crash = false;
    K = -1;
    Threshold = 0;
    NumofCars = 4;
    //for Tracks
    ellipse2x = (width/5)*3;
    ellipse1x = (width/5)*2;
    ellipsey = height/2;
    ellipseSize = 3*width/8;
    r = width/7;
    
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