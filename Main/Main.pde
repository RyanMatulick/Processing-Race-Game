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
// player car
float px; // x position
float py; // y position
int pcx; // starting x position on circle
int pcy; // starting y position on circle
float pt; // Rate of change around the circle
int BaseSpeed;
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
    Threshold = 0;
    //size (800*Scale,400*Scale); // if on web
    size(800,400);//If not on web
    frameRate(60);
    //for Tracks
    ellipse1x = 3*width/8;
    ellipse2x = width - ellipse1x;
    ellipsey = height/2;
    ellipseSize = 3*width/8;
    
    r = (ellipseSize+(50*Scale))/PI + 20*Scale;
    BaseSpeed = 40;
    //For playerCar
    pcx = ellipse1x;
    pcy = height/2;
    pt = 10;
    pMoveSpeed = BaseSpeed;
    //For Non-player car
    npcx = ellipse2x;
    
    npcy = height/2;
    npt = 10;
    npMoveSpeed = BaseSpeed;
}

void draw()
{
  background(150,255,0);
  DrawBackground();
  if(mousePressed == true)
  {
       if (pMoveSpeed <= BaseSpeed+40){pMoveSpeed= pMoveSpeed +3;}
  }
  else
  {
      if (pMoveSpeed > BaseSpeed) {pMoveSpeed = pMoveSpeed -3;}
  }
  if(Threshold >= 10)
  {
    BaseSpeed++;
    pMoveSpeed++;
    Threshold = 0;
  }
  //Debug Display
  text(pMoveSpeed,10,10);
  text(px,10,20);
  text(py,10,30);
  text(npMoveSpeed,width - 50,10);
  text(npx,width - 50,20);
  text(npy,width - 50,30);
  //Update Car Position
  pt = pt + pMoveSpeed/1000;
  px = (int)(pcx+r*cos(pt));
  py = (int)(pcy+r*sin(pt));
  DrawCar(px,py,pt);
  
  //non player car
  npMoveSpeed = BaseSpeed;
  npt = npt + npMoveSpeed/1000;
  npx = (int)(npcx+r*cos(npt));
  npy = (int)(npcy+r*sin(npt));
  DrawCar(npx,npy,npt);
  Threshold +=0.1;
}