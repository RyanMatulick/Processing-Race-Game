class Line
{
  Point first;
  Point second;
  Line(Point input1, Point input2)
  {
    first = input1;
    second = input2;
  }
  void display()
  {
    line(first.x,first.y,second.x,second.y); 
  }
  
  
  
}