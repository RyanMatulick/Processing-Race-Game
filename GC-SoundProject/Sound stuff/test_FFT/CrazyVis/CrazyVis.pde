Table FFT_table;

ArrayList <Branch> Branches = new ArrayList<Branch>();
void setup()
{
  size(1200,700);
  FFT_table = loadTable("new.csv");
  
  for (int i = 0; i<FFT_table.getColumnCount(); i++)
  {
    Branches.add(new Branch());
    for(int j = 0; j<FFT_table.getRowCount()-1; j++)
    {
      Branches.get(i).y1 += FFT_table.getFloat(j,i)*30;
      Branches.get(i).y2 += FFT_table.getFloat(j+1,i)*30;
      Branches.get(i).x1 += 0.6;
      Branches.get(i).x2 += 0.6;
      Point first = new Point(Branches.get(i).x1,Branches.get(i).y1);
      Point second = new Point(Branches.get(i).x2,Branches.get(i).y2);
      
      Line segment = new Line(first,second);
      Branches.get(i).addLine(segment);
    }
  }
  
}


void draw()
{
  background(255);
  stroke(0);
  for (int i = 0; i<FFT_table.getColumnCount(); i++)
  {
    Branches.get(i).display(); 
  }
  stroke(255,0,0);
  for (int i = 0; i< 20; i++)
  {
    line(i*(120*0.6),0,i*(120*0.6),height);
  }
  
}