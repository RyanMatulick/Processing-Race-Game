void DrawBackground()
{
  translate(ellipse1x,ellipsey,-20);
  Track.Draw(color(0,0,0));
  InsideTrack.Draw(color(254,230,0));
  translate(-ellipse1x,-ellipsey,20);
  translate(ellipse2x,ellipsey,-20);
  Track.Draw(color(0,0,0));
  InsideTrack.Draw(color(254,230,0));
  translate(-ellipse2x,-ellipsey,20); 
  
}