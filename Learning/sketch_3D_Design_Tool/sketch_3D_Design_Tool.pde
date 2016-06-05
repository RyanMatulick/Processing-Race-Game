
float LRrotation; // For Orbit
float UDrotation; // For Orbit
float orbitRadius;
float CamMoveSpeed = 3;
//camera positions
float Ixpos;
float Iypos;
float Izpos;
float xpos;
float ypos;
float zpos;

Shape shape;

Boolean [] KeyPress = new Boolean[20];
void setup() {
  size(500, 500, P3D);
  background(255);
  
  LRrotation = 0;
  UDrotation = 0;
  orbitRadius = 150;
  textSize(50);
  
  for (int i = 0; i<KeyPress.length; i++)
  {
   KeyPress[i] = false; 
  }
  
  
  shape = new Shape();
}


void draw() {
  background(255);
  lights();

  MyCamera();
  GetKeyPresses();
  
  shape.display();
  //print('UD')
  print(UDrotation,50,50,0);
  print(LRrotation,50,50,0);
}


void GetKeyPresses()
{
  
  if(KeyPress[0] == true) // Move Up
  {
    ypos += CamMoveSpeed;
  }
  
  if(KeyPress[1] == true) // Move down
  {
    ypos -= CamMoveSpeed;
  }
  
  if(KeyPress[2] == true) // Move Left
  {
    xpos -= CamMoveSpeed;
  }
  
  if(KeyPress[3] == true) // Move Right
  {
    xpos += CamMoveSpeed;
  }
  
  if(KeyPress[4] == true) // Orbit Up
  {
    UDrotation++;
  }
  if(KeyPress[5] == true) // Orbit down
  {
    UDrotation--;
  }
  if (KeyPress[6] == true)// Orbit Left
  {
    LRrotation++;
  }
  if (KeyPress[7] == true)// Orbit Right
  {
    LRrotation--;
  }
  if (KeyPress[8] == true)// Reset
  {
    LRrotation = 0;
    UDrotation = 0;
    Izpos = 0;
    Ixpos = 0;
    xpos = 0;
    ypos = 0;
  }
  if (KeyPress[9] == true)// Reset
  {
    orbitRadius -= 5;
  }
  if (KeyPress[10] == true)// Reset
  {
    orbitRadius += 5;
  }
  
}