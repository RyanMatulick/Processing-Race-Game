// CODE WORKS IN BROWSER

//Initialisers
float Threshold;
//tracks
int Scale;
int ellipse1x;
int ellipse2x;
int ellipsey;
int ellipseSize;
float r; // variable used to place cars
boolean Crash;
// player car
float px; // x position
float py; // y position
int pcx; // starting x position on circle
int pcy; // starting y position on circle
float pt; // Rate of change around the circle
int pBaseSpeed; //starting speed for players car
int npBaseSpeed; //starting speed for np's car
float pMoveSpeed;
//Non-player car
float npx; // x position
float npy; // y position
int npcx; // starting x position on circle
int npcy; // starting y position on circle
float npt; // Rate of change around the circle
float npMoveSpeed;

void setup()
{
    Scale = 1;
    //size (800*Scale,400*Scale); // if on web
    size(800,400);//If not on web
    frameRate(60);
  
    mySetup();
}

void draw()
{
  background(150,255,0);
  DrawBackground();
  if(mousePressed == true)
  {
       if (pMoveSpeed <= pBaseSpeed+40){pMoveSpeed= pMoveSpeed +3;}
  }
  else
  {
      if (pMoveSpeed > pBaseSpeed) {pMoveSpeed = pMoveSpeed -3;}
  }
  if(Threshold >= 10)
  {
    npBaseSpeed++;  //only updates np's speed
    Threshold = 0;
  }
  //Debug Display
  text(pMoveSpeed,10,10);
  text(px,10,20);
  text(py,10,30);
  text(npMoveSpeed,width - 50,10);
  text(npx,width - 50,20);
  text(npy,width - 50,30);
  text(r,10,70);
  //Update Car Position
  pt = pt + pMoveSpeed/1000;
  px = (int)(pcx+r*cos(pt));
  py = (int)(pcy+r*sin(pt));
  DrawCar(px,py,pt);
  //PrintPoints(px,py,pt+0.14);
  
  //non player car
  npMoveSpeed = npBaseSpeed;
  npt = npt + npMoveSpeed/1000;
  npx = (float)(npcx+r*cos(npt));
  npy = (float)(npcy+r*sin(npt));
  DrawCar(npx,npy,npt);
  
  
  Threshold +=0.1;

 boolean Answer = FindCollision(px,py,pt+0.14,npx,npy,npt+0.14);
  if(Answer == true)
  {
    Crash = true;
  }
  if (Crash == true)
  {
     text("CRASH",10,40);
     Crash = false;
     getKey();
 }
}