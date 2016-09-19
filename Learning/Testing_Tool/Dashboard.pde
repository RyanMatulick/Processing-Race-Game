void dashboard()
{
  translate(cxpos-width/2,cypos+height/2,0);
  rect(0,0,width,-200);
  translate(0,0,5);
  scale(1.6);
  speedo(CarArray[0].getSpeed(),200,-5);
  scale(0.625);
  translate(0,0,-5);
  translate(-cxpos+width/2,-cypos-height/2,0);
  
  
}



void speedo(float speed, int TX, int TY)
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
    if (i%2==0)
    {   
      fill(255);
      textSize(12);
      text(10*i,70*lineX-10,70*lineY);
    }
  }
  //Speedo Line
  stroke(23,209,216);
  strokeWeight(5);
  line(-110*cos(speed*PI/120),-110*sin(speed*PI/120),0,0);
  //bottom line
  stroke(0);
  strokeWeight(5);
  line(-115,2,115,2);
  //reset
  translate(-TX,-TY);
}