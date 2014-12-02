//Ball b;      //declare Ball b
Ball[] b = new Ball[99];    //declare and intialize array b
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
for (int i=0; i<b.length; i++){
  b[i]= new Ball();
}
}

void draw() {
  background(0);
  for (int i = 0; i < b.length; i++) {
    b[i].display();
    b[i].move();
    //b[i].bounce();
  }
}




class Ball {
  //declare variables
  PVector loc, vel, acc;
  float sz;
  float hue;
  float alpha;
  Ball() {
    //intialize variables
   loc = new PVector (width/2,height/2);
    vel = new PVector(random(-3,3),random(-1,0));
    acc = new PVector(random(.001,.01));
    sz = random(10, 100);
    hue = random(200,299);
    alpha=100;
  }
  void move() {
    vel.add(acc);
    loc.add(vel);
  }
  void wraparound(){
    if(loc.y-sz/2>height){
      loc.set(mouseX,mouseY);
    }
  }
  //void bounce() {
   // if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
   //   vel.x *= -1;
   // }
   // if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
   //   vel.y *= -1;
   // }
 // }
  void display() {
    fill(hue, 100, 100, 100);
    ellipse(loc.x, loc.y, sz, sz);
  }
}
