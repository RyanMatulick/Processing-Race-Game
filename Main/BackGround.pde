void DrawBackground(Car Player1,Car Player2)
{
  float p1speed = Player1.getSpeed();
  float p2speed = Player2.getSpeed();
  float p1boost = Player1.boost;
  float p2boost = Player2.boost;
  noFill();
  
  stroke(100,100,100);
  strokeWeight((height+width)/20);
  ellipse(ellipse1x,ellipsey,3*width/8,3*width/8);
  ellipse(ellipse2x,ellipsey,3*width/8,3*width/8);
  
  fill(255);
  textSize(19);
  if (Crash == false)
  {
    text("Player 1's Speed:",80,450);
    text((int)p1speed,240,450);
    text("Player 2's Speed:",500,450);
    text((int)p2speed,660,450);
    Speedo(p1speed,150,height-20);
    Speedo(p2speed,550,height-20);
    BOOST(p1boost,360,height-100);
    BOOST(p2boost,760,height-100);
  }
}