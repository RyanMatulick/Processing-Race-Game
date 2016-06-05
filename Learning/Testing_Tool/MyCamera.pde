//camera positions
float Ixpos;
float Iypos;
float Izpos;
float xpos;
float ypos;
float zpos;

float LRrotation; // For Orbit
float UDrotation; // For Orbit
float orbitRadius;
float CamMoveSpeed;

void MyCamera()
{
  Ixpos = cos(radians(UDrotation))*sin(radians(LRrotation))*orbitRadius;
  Iypos = sin(radians(UDrotation))*sin(radians(LRrotation))*orbitRadius;
  Izpos = cos(radians(LRrotation))*orbitRadius;
  
  camera(Ixpos + xpos, Iypos + ypos, Izpos , xpos, ypos, zpos, 0, 1, 0);
  stroke(0,0,255);// Blue Z
  line(0,0,0,0,0,500);
  stroke(0,255,0); // Green Y
  line(0,0,0,0,500,0);
  stroke(255,0,0); // Red X
  line(0,0,0,500,0,0); 
}