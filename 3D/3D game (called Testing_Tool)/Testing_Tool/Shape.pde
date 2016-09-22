class Vehicle
{
  // The PShape object
  PShape s;
  PShape a;
  float Length;
  float Width;
  // ------------ From Last Time
  float xpos; // x position
  float ypos; // y position
  float cx; // starting x position on circle
  float cy; // starting y position on circle
  float t; // Rate of change around the circle
  float BaseSpeed; //starting speed for players car
  float speed;
  float boost;
  boolean canBoost;
  char control; // Key corresponding to player movement
  boolean KeyPressed;
  int score;
  boolean BScore; // If Player is on score line
  float [] Wobble = new float[3];
  boolean SwapWabbleZ;
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
    score = 0;
    BScore = false;
    canBoost = true;
    
    Wobble[0] = random(0,2);
    Wobble[1] = random(0,2);
    Wobble[2] = random(0,3);
    SwapWabbleZ = false;
  }

  void display()
  {
    strokeWeight(1);
    Wobble[0] = random(0,0.1);
    Wobble[1] = random(0,0.1);
    
    if (Wobble[2] >= 3)
    {
      SwapWabbleZ = true;
    }
    else if(Wobble[2] <=0)
    {
      SwapWabbleZ = false;
    }
    
    if (SwapWabbleZ == true)
    {
      Wobble[2] -= random(0,0.3);
    }
    else
    {
      Wobble[2] += random(0,0.3);
    }
    
    
    // Locating and drawing the shape
    translate(xpos, ypos);
    rotate(t);
    a.translate(Wobble[0],Wobble[1],Wobble[2]);
    s.translate(Wobble[0]*10,Wobble[1],0);
    pushMatrix();
    s.setFill(color(0,255,0));
    s.setStroke(0);
    shape(s);
    a.setFill(color(255,0,255));
    a.setStroke(0);
    shape(a);
    popMatrix();
    rotate(-t);
    s.translate(-Wobble[0]*10,-Wobble[1],0);
    a.translate(-Wobble[0],-Wobble[1],-Wobble[2]);
    translate(-xpos, -ypos);
    
  }
  
  void setT(float T)
  {
    t = T;
  }
  void setX(float X)
  {
   xpos = X; 
  }
  void setY(float Y)
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
  
  void setScore(int s)
  {
    score = s;
  }
  void setBScore(boolean tf)
  {
    BScore = tf;
  }

  float getT()
  {
   return t; 
  }
  float getX()
  {
   return xpos; 
  }
  float getY()
  {
   return ypos; 
  }
  float getCX()
  {
   return cx; 
  }
  float getCY()
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
  int getScore()
  {
    return score;
  }
  boolean getBScore()
  {
    return BScore;
  }
  
}