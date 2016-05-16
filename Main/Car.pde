void DrawCar(float x, float y, float t)
{
  translate(x,y);
  rotate(t+0.14); // 0.14 is a correction value
  scale(Scale);
  strokeWeight(1);
  
  fill(200,200,255);//car body
  rect(0,0,20,40);
  rect(2,7,16,20);
  fill(255,255,0);// front lights
  rect(0,35,7,5);
  rect(13,35,7,5);
  fill(255,0,0);// back lights
  rect(0,0,5,7);
  rect(15,0,5,7);
  
  //Reset For next Car
  rotate(-(t+0.14));
  translate(-x,-y);
}