void Speedo(float speed, int TX, int TY)
{
  translate(TX,TY);
  fill(100,100,100);

  strokeWeight(5);
  // Back of Speedo
  stroke(0);
  arc(0,0,230,230,-PI,0);
  float lineX;
  float lineY;
  for(int i=120;i<180;i++){
    //Colored Lines
    stroke(0+(i*255/180),255-(i*255/180),0);
    strokeWeight(3);
    lineX = -cos(i*PI/180);
    lineY = -sin(i*PI/180);
    line(111*lineX,111*lineY,100*lineX,100*lineY);
  }
  for(int i=0;i<13;i++){
    //interval Lines
    stroke(255);
    strokeWeight(2);
    lineX = -cos(i*PI/12);
    lineY = -sin(i*PI/12);
    line(111*lineX,111*lineY,90*lineX,90*lineY); 
    fill(255);
  }
  //Speedo Line
  stroke(223,9,216);
  line(-110*cos(speed*PI/120),-110*sin(speed*PI/120),0,0);
  //bottom line
  stroke(0);
  strokeWeight(5);
  line(-115,2,115,2);
  //reset
  translate(-TX,-TY);
}

void BOOST(float boost, int TX, int TY)
{
  
  translate(TX,TY);
  scale(0.8);
  rotate(-PI/2.4);
  fill(100,100,100);

  strokeWeight(5);
  // Back of Speedo
  stroke(0);
  arc(0,0,230,230,-PI,-PI*30/180);
  float lineX;
  float lineY;
  for(int i=0;i<45;i++){
      //Colored Lines
      stroke(255-(i*255/180),0+(i*255/180),0);
      strokeWeight(3);
      lineX = -cos(i*PI/180);
      lineY = -sin(i*PI/180);
      line(111*lineX,111*lineY,100*lineX,100*lineY);
  }
  for(int i=0;i<11;i++)
  {
    //interval Lines
    stroke(255);
    strokeWeight(2);
    lineX = -cos(i*PI/12);
    lineY = -sin(i*PI/12);
    line(111*lineX,111*lineY,90*lineX,90*lineY);
  }
  //Boost Line
  stroke(223,9,216);
  line(-110*cos(boost*PI/132),-110*sin(boost*PI/132),0,0);
  //bottom line
  stroke(0);
  strokeWeight(5);
  line(-115,2,0,2);
  line(0,2,98,-56);
  //reset
  rotate(PI/2.4);
  scale(1.25);
  translate(-TX,-TY);
}