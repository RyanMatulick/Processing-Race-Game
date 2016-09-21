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
  
  // print camera pos
  /*
  fill(0);
  text(Ixpos,950,510,50);
  text(cxpos, 950,520,50); // 438
  text(Iypos,950,530,50);
  text(cypos, 950,540,50); // 315
  text(Izpos,950,550,50); // 540
  text(czpos, 950,560,50);
  text(orbitRadius,950,570,50);
  text(UDrotation,950,580,50);
  text(LRrotation,950,590,50);
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