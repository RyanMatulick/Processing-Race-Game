void mySetup()
{
    Threshold = 0;
    //for Tracks
    ellipse1x = 3*width/8;
    ellipse2x = width - ellipse1x;
    ellipsey = height/2;
    ellipseSize = 3*width/8;
    
    r = (ellipseSize+(50*Scale))/PI + 20*Scale;
    pBaseSpeed = 40;
    npBaseSpeed = 40;
    Crash = false;
    //For playerCar
    pcx = ellipse1x;
    pcy = height/2;
    pt = 10;
    pMoveSpeed = pBaseSpeed;
    //For Non-player car
    npcx = ellipse2x;
    npcy = height/2;
    npt = 10;
    npMoveSpeed = npBaseSpeed;
}

void getKey()
{
  noLoop();
  text("in get Key",10,100);
  boolean a = true;
  while(a)
  {
    text("in Loop",10,60);
    if (keyPressed) 
    {
      text("key Pressed",10,70);
      if (key == 'r' || key == 'R') 
         {
           text("r pressed",10,80);
           a = false;
         }
    }
  }
  mySetup();
  loop();
}