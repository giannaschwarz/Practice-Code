
Ball[] balls = new Ball[20];
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  b=new Ball();
}

void draw() {
  background(0);
  b.display();
  b.move();
  b.bounce();
}
class Ball {
  //declare variables
  PVector loc, vel, acc;
  float sz;
  float hue;
  float alpha;
  Ball() {
    //intialize variables
    loc = new PVector(width/2, height/2);
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    sz = random(10, 100);
    hue = random(360);
    alpha=100;
  }
  void move() {
    vel.add(acc);
    loc.add(vel);
  }
  void bounce() {
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
    }
    if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
      vel.y *= -1;
    }
  }
  void display() {
    fill(hue, 100, 100, 100);
    ellipse(loc.x, loc.y, sz, sz);
  }
}

