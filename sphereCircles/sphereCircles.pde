
float num,D,rad,maxDist;
float cnt,pos[];
int sphNum;

void setup() {
  size(400,400);
  num=9;
  D=(PI-PI/24)/(num-1);
  rad=200;
  ellipseMode(CENTER);
  sphNum=200;
  pos=new float[sphNum*4];
  maxDist=sqrt(200*200+200*200+200*200);
  for(int i=0; i<pos.length; i++) {
    if(i%4==3) pos[i]=random(15)+10f;
    else pos[i]=random(400)-200;
  }
}

void loop() {
  cnt++;
//  background(255,0,128);
//  background(0,200,255);
  background(80,100,55);
  translate(width/2,height/2,-200);
  rotateX(PI/6+radians(cnt));
  rotateY(PI/12+radians(cnt*0.5f));
  noFill();
  noStroke();
  stroke(0,0,50,100);//255,255,255, 100);//200,220,255, 150);
  stroke(200,250,0, 100);//255,255,255, 100);//200,220,255, 150);
  for(int i=0; i<sphNum; i++) {
    if(i%1==0) 
      stringSphere(pos[i*4],pos[i*4+1],pos[i*4+2],pos[i*4+3]);
    else
      crossSphere(pos[i*4+1],pos[i*4+2],pos[i*4+0],pos[i*4+3]);
  }
}

void crossSphere(float x,float y,float z, float rad) {
  pushMatrix();
  translate(x,y,z);
  line(0,-rad,0, 0,rad,0);
  line(0,0,-rad, 0,0,rad);
  line(-rad,0,0, rad,0,0);
  
  ellipse(0,0,rad,rad);
  rotateX(PI/2);
  ellipse(0,0,rad,rad);
  rotateY(PI/2);
  ellipse(0,0,rad,rad);
  popMatrix();
}

void stringSphere(float x,float y,float z, float rad) {
  pushMatrix();
  translate(x,y,z);
  for(float i=0; i<num; i++) {
    pushMatrix();
    translate(0,cos(PI/12+D*i)*rad,0);
    rotateX(PI/2);
    ellipse(0,0,sin(PI/12+D*i)*rad,sin(PI/12+D*i)*rad);
    popMatrix();
  }
  popMatrix();  
}
