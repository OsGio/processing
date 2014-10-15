// what this is doing
// (1 if boolean saved = true) display music with the help of a common library
// (2 if boolean saved = true) save the music data in an array
// (3 if boolean saved = true) export this data into a .txt file
// (4) load this text file and display it
 
// Code by Diana Lange
// www.diana-lange.de
 
// Music: CocoRosie - The Moon asked the crow
// http://www.cocorosieland.com/
// http://www.myspace.com/cocorosie
 
 
import ddf.minim.*;
 
Minim minim;
AudioPlayer groove;
Saver saver;
Displayer displayer;
 
PFont font;
boolean saved = true, loaded = false, playMusic = false;
int offsetFrame = 0;
 
void setup()
{
  size(512, 200);
  background (255);
 
  frameRate (30);
 
  minim = new Minim(this);
  int buffer = 1024;
  String path = "./";
 
  font = createFont("Arial", 12);
  textFont(font, 12);
 
  groove = minim.loadFile("music.mp3", buffer);
  saver = new Saver (buffer, path);
 
  if (!saved || playMusic) groove.play();
 
  fill (0);
  stroke (0);
}
 
void draw()
{
  background(255);
  if (!saved) saveMusicData ();
  else displayMusicData();
}
 
void displayMusicData()
{
  if (!loaded)
  {
    displayer = new Displayer (saver.getPath(), saver.getBuffer());
    loaded = true;
     
  }
   
  if (!displayer.isPlaying()) frameCount = offsetFrame;
  if (frameCount > displayer.getAudioLength())
  {
    frameCount = 0;
    if (playMusic) groove.play(frameCount % displayer.getAudioLength()*100/3);
  }
   
  text ("Is Displayling. " + "FrameRate: " + nf (frameRate, 2, 1) + ", current Frame: " + str (frameCount % displayer.getAudioLength()), 20, 20);
  float [] currentData = displayer.data (frameCount % displayer.getAudioLength());
   
  beginShape();
  for (int i = 0; i < currentData.length; i++)
  {
     float x = i * ((float) width/ (float) currentData.length);
     float y = height/2 + currentData [i];
      
     float x2 = width/2 + cos (TWO_PI / currentData.length * i) * (50+currentData [i]);
     float y2 = height/2 + sin (TWO_PI / currentData.length * i) * (50+currentData [i]);
      
     vertex (lerp (x, x2, (float)mouseX/(float)width), lerp (y, y2,(float)mouseY/(float)height));
  }
  endShape();
}
 
void saveMusicData ()
{
  text ("Is Saving. " + "FrameRate: " + nf (frameRate, 2, 1) + ", current Frame: " + str (frameCount), 20, 20);
 
  if (groove.isPlaying())
  {
    for (int i = 0; i < groove.bufferSize(); i++)
    {
      int x = i * width/groove.bufferSize();
      float y = (groove.left.get(i)+groove.right.get(i)) * 20;
 
      point (x, height/2+y);
 
      saver.setElement(y);
    }
 
    saver.increaseLength();
  }
  else
  {
    saver.saveData();
    saved = true;
  }
}
 
 
void stop()
{
  groove.close();
  minim.stop();
  super.stop();
}

