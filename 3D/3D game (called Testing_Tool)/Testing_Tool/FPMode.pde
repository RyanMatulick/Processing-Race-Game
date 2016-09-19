void thirdPersonMode()
{
    int px = CarArray[0].getX();
    int py = CarArray[0].getY();
    float pt = CarArray[0].getT();
  
    //Dimensions of Car
    Point Q1 = new Point(10,-140);
    Point Q2 = new Point(-10,30);
    
    //Points on Player Car
    Point P1 = new Point(Q1.x*cos(pt)+Q1.y*sin(-pt)+px,Q1.x*sin(pt)+Q1.y*cos(pt)+py);
    Point P2 = new Point(Q2.x*cos(pt)+Q2.y*sin(-pt)+px,Q2.x*sin(pt)+Q2.y*cos(pt)+py);
    strokeWeight(5);
    line(P1.x,P1.y,15,P2.x,P2.y,10);
 
  Ixpos = P1.x;
  Iypos = P1.y;
  cxpos = P2.x;
  cypos = P2.y;
  
  camera(Ixpos, Iypos, 50, cxpos, cypos, 50, 0, 0, -1);
  
  
}

boolean isFPM = false;
boolean FPMtoggle = false;