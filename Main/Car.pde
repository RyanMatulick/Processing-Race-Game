void DrawCar(Car car)
{
  int x = car.getX();
  int y = car.getY();
  float t = car.getT();
  translate(x,y);
  rotate(t+0.14); // 0.14 is a correction value
  strokeWeight(1);
  stroke(100,100,100);
  fill(200,200,255);//car body
  rect(0,0,20,40);
  rect(2,7,16,20);
  fill(255,255,0);// front lights
  rect(0,35,7,5);
  rect(13,35,7,5);
  fill(255,0,0);// back lights
  rect(0,0,5,7);
  rect(15,0,5,7);
  
  //Reset For next Car
  rotate(-(t+0.14));
  translate(-x,-y);
} 

class Car
{

  int xpos; // x position
  int ypos; // y position
  int cx; // starting x position on circle
  int cy; // starting y position on circle
  float t; // Rate of change around the circle
  float BaseSpeed; //starting speed for players car
  float speed;
  float boost;
  boolean canBoost;
  char control;
  boolean KeyPressed;
  Car(int Cx, int Cy, int Speed)
  {
    KeyPressed = false;
    BaseSpeed = Speed;
    speed = BaseSpeed; 
    cx = Cx;
    cy = Cy;
    t = 10;
    boost = 100;
    canBoost = true;
  }
  void setT(float T)
  {
    t = T;
  }
  void setX(int X)
  {
   xpos = X; 
  }
  void setY(int Y)
  {
   ypos = Y; 
  }
  void setSpeed(float Speed)
  {
   speed = Speed; 
  }
  void setBaseSpeed(float BSpeed)
  {
    BaseSpeed = BSpeed;
  }
  void setControl(char Control)
  {
    control = Control; 
  }
  
  float getT()
  {
    return t;
  }
  int getX()
  {
   return xpos; 
  }
  int getY()
  {
   return ypos; 
  }
  int getCX()
  {
   return cx; 
  }
  int getCY()
  {
   return cy; 
  }
  float getSpeed()
  {
   return  speed;
  }
  float getBaseSpeed()
  {
   return  BaseSpeed;
  }
  char getControl()
  {
   return control; 
  }
}