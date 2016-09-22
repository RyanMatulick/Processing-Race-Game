class Button3D
{
  int ButtonX;
  int ButtonY;
  int ButtonZ;
  int ButtonWidth;
  int ButtonHeight;
  int ButtonDepth;
  float rotateX;
  float rotateY;
  float rotateZ;
  String Label;
  int MenuState;
  int R;
  int G;
  int B;
  int sR;
  int sG;
  int sB;
  boolean isActive;
  boolean isOver;
  Button3D(int iButtonX, int iButtonY, int iButtonZ, int iButtonWidth, int iButtonHeight, int iButtonDepth, float irotateX, float irotateY, float irotateZ, String iLabel, int iR, int iG, int iB)
  {
    isActive = false;
    isOver = false;
    ButtonX = iButtonX;
    ButtonY = iButtonY;
    ButtonZ = iButtonZ;
    ButtonWidth = iButtonWidth;
    ButtonHeight = iButtonHeight;
    ButtonDepth = iButtonDepth;
    rotateX = irotateX;
    rotateY = irotateY;
    rotateZ = irotateZ;
    Label = iLabel;
    sR = iR;
    sG = iG;
    sB = iB;
  }
  void Display(Boolean Select)
  {
    getFill(Select);
    fill(R,G,B);
    translate(ButtonX,ButtonY,ButtonZ);
    rotateX(rotateX);
    rotateY(rotateY);
    rotateZ(rotateZ);
    
    box(ButtonWidth,ButtonHeight,ButtonDepth);
    
    fill(0);
    text(Label,0,5,10);
    
    rotateZ(-rotateZ);
    rotateY(-rotateY);
    rotateX(-rotateX);
    translate(-ButtonX,-ButtonY,-ButtonZ);
  }
  
  void getFill(Boolean Select)
  {
    R = sR;
    G = sG;
    B = sB;
    isOver = false;
    if (Select == true)
    {
        R = 250;
        G = 150;
        B = 10;
        isOver = true;
    }
  }
}