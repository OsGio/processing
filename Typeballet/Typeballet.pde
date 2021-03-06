// inspired by http://www.loftmatic.com/_pages/Research/GDV/P_3_0/GDV_02/P_3_0_01_GDV_02.html
 
PFont myFont; // defining a font variable
String myText = "incubation"; //defining a string variable to contain some text
float theta; // defining a float variable to be used as angle value
 
void setup() {
  size(500, 500);
  background(0);
 
  myFont = createFont("Arial", 24);
  textFont(myFont);
  textAlign(CENTER, CENTER);
}
 
void draw() {
  fill(0, 15);
  noStroke();
  rect(0, 0, width, height);
  fill(0, 220, 255, 30);
  float ts = map(sin(-theta*2), -1, 1, 50, 250); // the textsize moves from 50 to 250 and back
  textSize(ts);
  float y = map(sin(theta), -1, 1, height/4, height/4*3); // the y values moves from a quarter of the height to three quarters of the height
  text(myText, width/2, y);
  theta += 0.0523; // the amount that the angle (which influences both the text size and the vertical value) increases each frame

//saveFrame("img-####.png");
}

