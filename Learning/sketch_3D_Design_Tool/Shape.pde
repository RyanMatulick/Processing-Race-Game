// A class to describe a Star shape

class Shape {

  // The PShape object
  PShape s;
  PShape a;
  Shape() {
    s = createShape(BOX,20,40,15);
    s.setStroke(color(0));
    a = createShape(BOX,20,10,10);
    a.translate(0,20+5,-2.5);
    a.setStroke(color(0));
  }

  void display() {
    // Locating and drawing the shape
    pushMatrix();
    shape(s);
    shape(a);
    popMatrix();
  }
}