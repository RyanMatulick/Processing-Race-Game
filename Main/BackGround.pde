void DrawBackground(Car Player1,Car Player2)
{
  noFill();
  // Tracks
  stroke(100,100,100);
  strokeWeight((height+width)/20);
  ellipse(ellipse1x,ellipsey,3*width/8,3*width/8);
  ellipse(ellipse2x,ellipsey,3*width/8,3*width/8);
  
  
  // UI
  fill(255);
  textSize(19);
  text("Controls:",10,110);
  text("P1:",10,130);
  text(Player1.getControl(),50,130);
  text("P2:",10,150);
  text(Player2.getControl(),50,150);
  text("Reset: r",10,170);
  if (Crash == false)
  {
    text("Player 1 Score:",80,450);
    text(score1,220,450);
    text("Player 2 Score:",480,450);
    text(score2,620,450);
    Speedo(Player1.getSpeed(),150,height-20);
    Speedo(Player2.getSpeed(),550,height-20);
    BOOST(Player1.boost,360,height-100);
    BOOST(Player2.boost,760,height-100);
  }
}