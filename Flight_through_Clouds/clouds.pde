Automata [] a;
 
float sx = random (0.01, 0.12), sy = random (0.01, 0.05);
 
void setup()
{
  size (300, 300, P3D);
  frameRate (30);
  //smooth();
  a = new Automata [4];
  float speedX = random (0.01, 0.014);
  float speedY = random (0.01, 0.02);
  // println (speedX + ", " + speedY);
  for (int i = 0; i< a.length; i++) a[i] = new Automata (width, height, 80+i*40, speedX/(float) i, speedY/(float) i);
}
 
void draw ()
{
  background (0);
  if (frameCount % 25 == 0) move();
  for (int i = 0; i< a.length; i++)
  {
    a[i].draw();
    a[i].update (sx*((float) i/1.5), sy*((float) i / 1.5));
  }
}
 
void move ()
{
  int dir = (int) random (16);
  for (int i = 0; i< a.length; i++)
  {
    switch (dir)
    {
    case 0:
      a[i].changeDirX();
      break;
 
    case 1:
      a[i].changeDirY();
      break;
 
    case 2:
    case 3:
    case 4:
      sx = random (0.005, 0.08);
      break;
    case 5:
    case 6:
    case 7:
      sy = random (0.005, 0.08);
      break;
    }
  }
}

