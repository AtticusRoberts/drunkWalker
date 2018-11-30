Bounce[] ballArr;
int ballcount = 50;
int distance1 = 1000;
Walker[] drunkarr;
int walkerCount=200;
int counter=0;
int distance=300;
int move=1;
int thing;
void setup() {
  size(1000,1000,P3D);
  thing=0;
  ballArr=new Bounce[ballcount];
  for (int i=0;i<ballcount;i++) {
    ballArr[i]=new Bounce();
  }
  drunkarr=new Walker[walkerCount];
  for (int i=0;i<walkerCount;i++) {
    drunkarr[i]=new Walker();
  }
}
void draw() {
  //pointLight(0,0,255,width/2,height/2,200);
  background(255);
  if (thing==0) {
    camera(((distance*cos(frameCount/80.0)+width/2)),height/2,((distance*sin(frameCount/80.0))+200)
            ,width/2,height/2,200
            ,0,-1,0);
    for (Walker walker : drunkarr) {
      walker.walk();
      }
  }
  if (thing==1) {
      camera(((distance1*cos(frameCount/80.0)+width/2)),height/2,((distance*sin(frameCount/80.0))+200)
        ,width/2,height/2,200
        ,0,-1,0);
    for (Bounce ball : ballArr) {
      ball.bounce();
    }
  }
} 

void keyPressed() {
  if (key==CODED) {
    println(thing);
    if (keyCode==DOWN && thing==0) {
      
      drunkarr=new Walker[walkerCount];
      for (int i=0;i<walkerCount;i++) {
        drunkarr[i]=new Walker();
      } 
    }
    else if ((keyCode==LEFT || keyCode==RIGHT)&&thing==0) {
      thing=1;
    }
    else if ((keyCode==LEFT || keyCode==RIGHT)&&thing==1) {
      thing=0;
    }
  }
}
class Walker {
  float x;
  float y;
  float z;
  int r;
  int g;
  int b;
  Walker () {
    x=width/2;
    y=height/2;
    z=200;
    r= int(random(0,255));
    g = int(random(0,192));
    b = int(random(190,255));
  }
  void walk(){
    x=x+random(-move,move);
    y=y+random(-move,move);
    z=z+random(-move,move);
    if (x>=width||x<=0) {
      x=-x;
    }
    if (y>=height || y<=0) {
      y = -y;
    }
    if (z>=height || x<=0) {
      z=-z;
    }
    fill(r,g,b);
    lights();
    pushMatrix();
    translate(x,y,z);
    box(10);
    popMatrix();
  }
}
class Bounce {
  float xMove;
  float yMove;
  float zMove;
  float x;
  float y;
  float z;
  int r;
  int g;
  int b;
  Bounce () {
    yMove=random(1,5);
    xMove=random(1,5);
    zMove=random(1,5);
    x=random(1,800);
    y=random(1,800);
    z=random(1,250);
    r= int(random(0,255));
    g = int(random(0,192));
    b = int(random(190,255));
  }
  void bounce() {          
    if (x>=800 || x<=0) {
      xMove=-xMove;
      b++;
    }
    if (y>=800 || y<=0) {
      yMove=-yMove;
      r++;
    }
    if (z>250 || z<0) {
      zMove=-zMove;
      g++;
    }
    fill(r,g,b);
    lights();
    pushMatrix();
    translate(x,y,z);
    sphere(33);
    popMatrix();
    x=x+xMove;
    y=y+yMove;
    z=z+zMove;
  } 
}
