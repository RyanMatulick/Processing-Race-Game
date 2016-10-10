class BasicShape
{
  PShape s;
  PShape t;
  PShape b;
  float angle;
  float halfHeight;
  BasicShape(int sides, float r, float h, int st,int stW)
  {
    angle = 360 / sides;
    halfHeight = h / 2;
    
    // Create Shape
    t = createShape();
    // draw top of the tube
    t.beginShape();
    t.stroke(st);
    t.strokeWeight(stW);
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        t.vertex( x, y, -halfHeight);
    }
    t.endShape(CLOSE);
    
    b = createShape();
     //draw bottom of the tube
    b.beginShape();
    b.stroke(st);
    b.strokeWeight(stW);
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        b.vertex( x, y, halfHeight);
    }
    b.endShape(CLOSE);
    
    s = createShape();
    // draw sides
    s.beginShape(TRIANGLE_STRIP);
    s.noStroke();
    for (int i = 0; i < sides + 1; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        s.vertex( x, y, halfHeight);
        s.vertex( x, y, -halfHeight);    
    }
    s.endShape(CLOSE);
  }
  
  void Draw(color c)
  {
    b.setFill(c);
    t.setFill(c);
    s.setFill(c);
    
    pushMatrix();
   
    shape(t);
    shape(b);
    shape(s); // display shape
    popMatrix();
  }
}