Bouncer[] bouncers= new Bouncer[30];
void setup() {
  size(800, 600);
  for (int i=0; i<bouncers.length; i++) {
    bouncers[i]=new Bouncer(random(5, 50), random(.5, 10));
  }
}
void draw() {
  background(0);
  for (int i=0; i<bouncers.length; i++) {
    bouncers[i].display();
    bouncers[i].move();
    bouncers[i].wallBounce();
    for (int j=0; j<bouncers.length; j++) {
      if (i!=j) {
        bouncers[i].collideWith(bouncers[j]);
      }
    }
  }
}
class Bouncer {
  PVector loc, vel;
  float sz;
  float speed;

  Bouncer(float tempsz, float tempspeed) {
    sz=tempsz;
    loc=new PVector(random(sz, width-sz), random(sz, height-sz));
    vel= PVector.random2D();
    speed=tempspeed;
    vel.mult(speed);
  }
  void display() {
    float hue;
    hue=random(360);
    fill(hue);
    ellipse(loc.x, loc.y, sz, sz);
  }
  void move() {
    loc.add(vel);
  }
  void wallBounce() {
    if (loc.x+sz/2>width||loc.x-sz/2<0) {
      vel.x*=-1;
    }
    if (loc.y+sz/2>height ||loc.y-sz/2<0) {
      vel.y*=-1;
    }
  }
  void collideWith(Bouncer someOtherBall) {
    if (loc.dist(someOtherBall.loc)<sz/2+someOtherBall.sz/2) {
      vel=PVector.sub(loc, someOtherBall.loc);
      vel.normalize();
      vel.setMag(speed);
    }
  }
}

