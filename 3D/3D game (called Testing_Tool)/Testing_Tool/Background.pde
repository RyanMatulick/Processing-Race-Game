void DrawBackground()
{
  translate(ellipse1x,ellipsey,-20);
  Track.Draw();
  InsideTrack.Draw();
  translate(-ellipse1x,-ellipsey,20);
  translate(ellipse2x,ellipsey,-20);
  Track.Draw();
  InsideTrack.Draw();
  translate(-ellipse2x,-ellipsey,20); 
  
}