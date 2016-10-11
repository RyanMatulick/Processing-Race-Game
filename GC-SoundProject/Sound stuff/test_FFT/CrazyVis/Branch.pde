
class Branch
{
  ArrayList <Line> linelist = new ArrayList(); 
  float x1;
  float x2;
  float y1;
  float y2;
  Branch()
  {
    x1 = 0;
    x2 = 0.6;
    y1 = 0;
    y2 = 0;
  }
  void addLine(Line segment)
  {
    linelist.add(segment);  
  }
  void display()
  {
    for (int i = 0; i < linelist.size(); i++)
    {
      linelist.get(i).display();
    }
  }
}