boolean FindCollision(float px, float py, float pt,float npx, float npy, float npt)
{
    Point Q1 = new Point(0,0);
    Point Q2 = new Point(20,0); // car Height
    Point Q3 = new Point(20,40);
    Point Q4 = new Point(0,40); // car Length
    
    Point P1 = new Point(Q1.x+px,Q1.y+py);
    Point P2 = new Point(Q2.x*cos(pt)+px,Q2.x*sin(pt)+py);
    Point P3 = new Point(Q3.x*cos(pt)+Q3.y*sin(-pt)+px,Q3.x*sin(pt)+Q3.y*cos(pt)+py);
    Point P4 = new Point(Q4.y*sin(-pt)+px,Q4.y*cos(pt)+py);
    
    Point NP1 = new Point(0+npx,0+npy);
    Point NP2 = new Point(Q2.x*cos(npt)+npx,Q2.x*sin(npt)+npy);
    Point NP3 = new Point(Q3.x*cos(npt)+Q3.y*sin(-npt)+npx,Q3.x*sin(npt)+Q3.y*cos(npt)+npy);
    Point NP4 = new Point(Q4.y*sin(-npt)+npx,Q4.y*cos(npt)+npy);
    
    
    //Just To See Points
    
    text("P1",P1.x,P1.y);
    text("P2",P2.x,P2.y);
    text("P3",P3.x,P3.y);
    text("P4",P4.x,P4.y); 
    
    text("NP1",NP1.x,NP1.y);
    text("NP2",NP2.x,NP2.y);
    text("NP3",NP3.x,NP3.y);
    text("NP4",NP4.x,NP4.y);
    
    Point [] PlayerPoints = {P1,P2,P3,P4};
    Point [] EnemyPoints = {NP1,NP2,NP3,NP4};
    boolean ANSWER = false;
    for (int i = 0; i<4; i++)
    {
      int Nexti = i+1;
      if (Nexti == 4){Nexti = 1;}
      for (int j = 0; j<4; j++)
      { 
        int Nextj = j+1;
        if (Nextj == 4){Nextj = 1;}
        ANSWER = LinesIntersect(PlayerPoints[j],PlayerPoints[Nextj],EnemyPoints[i],EnemyPoints[Nexti]);
        if(ANSWER == true){return true;}
      }
    }
    
    return ANSWER;
}



boolean LinesIntersect(Point A, Point B, Point C,Point D)
{
  Point CmP = new Point(C.x - A.x, C.y - A.y);
  Point r = new Point(B.x - A.x, B.y - A.y);
  Point s = new Point(D.x - C.x, D.y - C.y);

  float CmPxr = CmP.x * r.y - CmP.y * r.x;
  float CmPxs = CmP.x * s.y - CmP.y * s.x;
  float rxs = r.x * s.y - r.y * s.x;

  float rxsr = 1 / rxs;
  float t = CmPxs * rxsr;
  float u = CmPxr * rxsr;

  return (t >= 0) && (t <= 1) && (u >= 0) && (u <= 1);
}

class Point
{
  float x,y;
  Point(float ix,float iy)
  {
      x = ix;
      y = iy;
  }
}