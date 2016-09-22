void UI()
{
  textSize(54);
  strokeWeight(5);
  stroke(0);   
  
  float SideBarwidth = width/6;
  //Rectanlges
  fill(160,160,160,160);
  rect(0,0,SideBarwidth,height); //LEFT
  rect(width,0,-SideBarwidth,height); //RIGHT
  rect(0,0,width,120); //TOP
  rect(0,height,width,-SideBarwidth/2); //BOTTOM

  //LEFT SIDE BRAKE
  if (CarArray[0].KeyPressed == true)
  {
    strokeWeight(5);
    fill(240,0,0);
    ellipse(SideBarwidth/2,height/3,SideBarwidth-50,SideBarwidth-50);//LEFT
    fill(0);
    text("BRAKE",SideBarwidth/2,height/3); //LEFT
  }
  else
  {
    strokeWeight(2);
    fill(255,0,0);
    ellipse(SideBarwidth/2,height/3,SideBarwidth-50,SideBarwidth-50);//LEFT
    fill(0);
    text("BRAKE",SideBarwidth/2+2,height/3); //LEFT
  }
  
  //Right SIDE BRAKE
  if (CarArray[1].KeyPressed == true)
  {
    strokeWeight(5);
    fill(240,0,0);
    ellipse(width-SideBarwidth/2,height*2/3,SideBarwidth-50,SideBarwidth-50);//RIGHT
    fill(0);
    text("BRAKE",width-SideBarwidth/2,height*2/3); //Right
  }
  else
  {
    strokeWeight(2);
    fill(255,0,0);
    ellipse(width-SideBarwidth/2,height*2/3,SideBarwidth-50,SideBarwidth-50);//RIGHT
    fill(0);
    text("BRAKE",width-SideBarwidth/2-2,height*2/3); //Right
  }
  
  //LEFT SIDE BOOST
  if (CarArray[0].KeyPressed == true)
  {
    strokeWeight(5);
    fill(0,240,0);
    triangle(SideBarwidth-25,height*2/3,25,height*2/3-SideBarwidth/2,25,height*2/3+SideBarwidth/2);//LEFT
    fill(0);
    text("BOOST",SideBarwidth/2-15,height*2/3);//LEFT
  }
  else
  {
    strokeWeight(2);
    fill(0,255,0);
    triangle(SideBarwidth-25,height*2/3,25,height*2/3-SideBarwidth/2,25,height*2/3+SideBarwidth/2);//LEFT
    fill(0);
    text("BOOST",SideBarwidth/2-13,height*2/3);//LEFT
  }
  
  //RIGHT SIDE BOOST
  if (CarArray[1].KeyPressed == true)
  {
    strokeWeight(5);
    fill(0,240,0);
    triangle(width-SideBarwidth+25,height/3,width-25,height/3-SideBarwidth/2,width-25,height/3+SideBarwidth/2);//RIGHT
    fill(0);
    text("BOOST",width-SideBarwidth/2+15,height/3);//RIGHT
  }
  else
  {
    strokeWeight(2);
    fill(0,255,0);
    triangle(width-SideBarwidth+25,height/3,width-25,height/3-SideBarwidth/2,width-25,height/3+SideBarwidth/2);//RIGHT
    fill(0);
    text("BOOST",width-SideBarwidth/2+13,height/3);//RIGHT
  }
    
  //TopBar
  strokeWeight(2);
  fill(255,255,0);
  arc(width/2, 0, 400, 240, 0, PI);//,CHORD
  line(width/2,0,width/2,120);
  fill(0);
  text(CarArray[0].getScore(),width/2-75,50);
  text(CarArray[1].getScore(),width/2+75,50);
  
  //BottomBar
  
  speedo(CarArray[0].getSpeed(),500,height-30);
  speedo(CarArray[1].getSpeed(),width-500,height-30);
}


float lineX;
float lineY;

void speedo(float speed, float TX, float TY)
{
  translate(TX,TY);
  fill(100,100,100);

  strokeWeight(5);
  // Back of Speedo
  stroke(0);
  arc(0,0,230,230,-PI,0);
  
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