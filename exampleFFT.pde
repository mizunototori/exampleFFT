// Minim 
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer in; 

// FFT
FFT fft;

// 
void setup()
{
  // Window size 
  size(600, 300);

  // Minim 
  minim = new Minim(this);
  in = minim.loadFile("flim.mp3", 1024);
  in.loop();
  
  // FFT 
  fft = new FFT(in.bufferSize(), in.sampleRate()); 
}

// 
void draw()
{
  // Set for drawing
  background(0);     
  stroke(255);

  // Call FFT 
  fft.forward(in.mix);  
  int specSize = fft.specSize();

  // Draw bins
  for (int i = 0; i < specSize; i++)
  {
    // get the bin by spectrum
    float x = map(i, 0, specSize, 0, width);
    line(x, height, x, height - fft.getBand(i) * 8);
  }
}

// 
void stop()
{
  minim.stop();
  super.stop();
}