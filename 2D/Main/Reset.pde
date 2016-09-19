void mySetup()
{
    Crash = false;
    K = -1;
    Threshold = 0;
    NumofCars = 4;
    score1 = 0;
    score2 = 0;
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