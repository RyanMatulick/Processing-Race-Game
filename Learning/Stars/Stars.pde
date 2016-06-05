Star []stars = new Star[20];

void setup()
{
  for (int i = 0; i< stars.length; i++)
  {
   stars[i] = new Star(); 
  }
}
void draw() {
  background(51);
  for (int i = 0; i < stars.length; i++) {
    stars[i].display();
  }
}

class Star {
  PShape s;
  float x, y;
Star() {
    // First create the shape
    s = createShape();
    s.beginShape();
    // You can set fill and stroke
    s.fill(102);
    s.stroke(255);
    s.strokeWeight(2);
    // Here, we are hardcoding a series of vertices
    s.vertex(0, -50);
    s.vertex(14, -20);
    s.vertex(47, -15);
    s.vertex(23, 7);
    s.vertex(29, 40);
    s.vertex(0, 25);
    s.vertex(-29, 40);
    s.vertex(-23, 7);
    s.vertex(-47, -15);
    s.vertex(-14, -20);
    s.endShape(CLOSE);
  }
  void display() {
    shape(s);
  }
  
}