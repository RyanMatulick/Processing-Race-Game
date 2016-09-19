BasicShape Shape;

void setup()
{
    size(450, 450, P3D);
    // Vertices,Width,Length
    Shape = new BasicShape(30,20,20);
}

void draw()
{
    background(0, 128, 255);
    lights();
    
    fill(255, 128, 0);

       
    translate( 120, 330, 0 );
    Shape.Draw();
}