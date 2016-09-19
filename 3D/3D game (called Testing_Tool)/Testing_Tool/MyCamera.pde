//camera positions
float Ixpos;
float Iypos;
float Izpos;
float cxpos;
float cypos;
float czpos;

float LRrotation; // For Orbit
float UDrotation; // For Orbit
float orbitRadius;
float CamMoveSpeed;

void MyCamera()
{
  /*
  // print camera pos
  text(Ixpos,450,210,200);
  text(xpos, 450,220,200); // 438
  text(Iypos,450,230,200);
  text(ypos, 450,240,200); // 315
  text(Izpos,450,250,200); // 540
  text(zpos, 450,260,200);
  */
  
  
  Ixpos = cos(radians(UDrotation))*sin(radians(LRrotation))*orbitRadius;
  Iypos = sin(radians(UDrotation))*sin(radians(LRrotation))*orbitRadius;
  Izpos = cos(radians(LRrotation))*orbitRadius;
 
  if (isFPM == false)
  {
    thirdPersonMode();
  }
  else
  {
   camera(Ixpos + cxpos, Iypos + cypos, Izpos , cxpos, cypos, czpos, 0, 1, 0);
  }
  
  
  
  
  stroke(0,0,255);// Blue Z
  line(0,0,0,0,0,500);
  stroke(0,255,0); // Green Y
  line(0,0,0,0,500,0);
  stroke(255,0,0); // Red X
  line(0,0,0,500,0,0); 
}