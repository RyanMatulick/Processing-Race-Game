import processing.sound.*;

// Declare the processing sound variables 
SoundFile sample;
FFT fft;
Amplitude rms;
AudioDevice device;

// used to "zoom" in order to not view really high frequencies
int FFTView = 3;

// Declare a scaling factor
int scale=25;

// Define how many FFT bands we want
int bands = 512;

// declare a drawing variable for calculating rect width
float r_width;

// Create a smoothing vector
float[] sum = new float[bands];

// Create a smoothing factor
float smooth_factor = 0.01;

// Used for smoothing
float sum2;


Table FFT_Table = new Table();
FloatList FFTStore = new FloatList();


// It saves 1 value per band at the framerate of the canvas.
public void setup()
{
  frameRate(120);
  size(640, 360);
  background(255);
  
  //Set up the spreadsheet
  for(int i =0; i<bands; i++)
  {
     FFT_Table.addColumn();
  }
  
  // If the Buffersize is larger than the FFT Size, the FFT will fail
  // so we set Buffersize equal to bands
  device = new AudioDevice(this, 44100, bands);
  
  // Calculate the width of the rects depending on how many bands we have
  r_width = (width/float(bands))*FFTView;
  
  // Load and play a soundfile and loop it. 
  // This has to be called 
  // before the FFT is created.
  String song = "Intervals.mp3";
  sample = new SoundFile(this, song);
  sample.loop();
 
  // Create and patch the FFT analyzer
  fft = new FFT(this, bands);
  fft.input(sample);
  
  println("SFSampleRate= " + sample.sampleRate() + " Hz");
  println("SFSamples= " + sample.frames() + " samples");
  println("SFDuration= " + sample.duration() + " seconds");
}      

public void draw() 
{
  // Set background color, noStroke and fill color
  background(125,255,125);
  
  // c88 line e.g. the highest note on a piano
  fill(255,0,150);
  stroke(0);
  //0.18555 = 95/512
  text("C88",width*(0.18555)*FFTView+5,100);
  line(width*(0.18555)*FFTView,0,width*(0.18555)*FFTView,height);
  noStroke();
 
  fft.analyze();

  for (int i = 0; i < bands/FFTView; i++) 
  {
    // smooth the FFT data by smoothing factor
    sum[i] += (fft.spectrum[i] - sum[i]) * smooth_factor;
    // draw the rects with a scale factor
    rect( (i)*r_width, height, r_width, -fft.spectrum[i]*height*scale );
  }
 
  // put values into table
  TableRow newRow = FFT_Table.addRow();
  for(int i =0; i<FFT_Table.getColumnCount(); i++)
  {
    newRow.setFloat(i, fft.spectrum[i]);
  }
  // save table and exit program
  if (key == 'g')
  {
    saveTable(FFT_Table, "data/new.csv");
    exit();
  }
}