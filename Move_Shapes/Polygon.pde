class Polygon
{
  PShape Poly;
  Polygon(ArrayList<Vertex> Points) // Make Polygon
  {
   Poly = createShape();
   Poly.setStroke(color(0,0,255));
   Poly.setFill(color(120,0,120));
   Poly.beginShape();
   for(int i = 0; i<Points.size(); i++)
   {
     Poly.vertex(Points.get(i).x,Points.get(i).y);
   }
   Poly.endShape(CLOSE);
  }
  
  void display()
  {   
   pushMatrix();
   shape(Poly);
   popMatrix();
  }
  
}