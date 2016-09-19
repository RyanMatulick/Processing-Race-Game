// A class to describe a Star shape

class Vehicle
{
  // The PShape object
  PShape s;
  PShape a;
  float Length;
  float Width;
  // ------------ From Last Time
  int xpos; // x position
  int ypos; // y position
  int cx; // starting x position on circle
  int cy; // starting y position on circle
  float t; // Rate of change around the circle
  float BaseSpeed; //starting speed for players car
  float speed;
  float boost;
  boolean canBoost;
  char control; // Key corresponding to player movement
  boolean KeyPressed;
  // From Last Time
  Vehicle(int Cx, int Cy, int Speed)
  {
    s = createShape(BOX,20,40,15);
    a = createShape(BOX,20,10,10);
    a.translate(0,20+5,-2.5);
    Length = 50;
    Width = 20;
    
    //
    KeyPressed = false;
    BaseSpeed = Speed;
    speed = BaseSpeed; 
    cx = Cx;
    cy = Cy;
    t = 10;
    boost = 100;
    canBoost = true;
  }

  void display()
  {
    strokeWeight(1);
    
    // Locating and drawing the shape
    translate(xpos, ypos);
    rotate(t);
    pushMatrix();
    s.setFill(color(0,255,0));
    shape(s);
    a.setFill(color(255,0,255));
    shape(a);
    popMatrix();
    rotate(-t);
    translate(-xpos, -ypos);
    
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