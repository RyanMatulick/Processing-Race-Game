void MyCamera()
{
  Ixpos = cos(radians(UDrotation))*sin(radians(LRrotation))*orbitRadius;
  Iypos = sin(radians(UDrotation))*sin(radians(LRrotation))*orbitRadius;
  Izpos = cos(radians(LRrotation))*orbitRadius;
  
  camera(Ixpos , Iypos , Izpos , xpos, ypos, zpos, 0, 1, 0);
  stroke(0,0,255);// Blue Z
  line(0,0,0,0,0,500);
  stroke(0,255,0); // Green Y
  line(0,0,0,0,500,0);
  stroke(255,0,0); // Red X
  line(0,0,0,500,0,0); 
}