void DrawBackground()
{
  noFill();
  
  stroke(100,100,100);
  strokeWeight((height+width)/20);
  ellipse(ellipse1x,ellipsey,3*width/8,3*width/8);
  ellipse(ellipse2x,ellipsey,3*width/8,3*width/8);
}