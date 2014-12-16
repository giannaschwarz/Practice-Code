ArrayList<BouncyBall> food = new ArrayList<BouncyBall>();
BlackHole devourerOfAllThings;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  devourerOfAllThings = new BlackHole();
}

void draw() {
  background(360);
  devourerOfAllThings.display();
  if (mousePressed) {
    food.add(new BouncyBall(random(5, 30), random(.1, 5)));
  }
  for (int i = 0; i < food.size (); i++) {
    BouncyBall b = food.get(i);
    b.display();
    b.move();
    b.isSuckedIn(devourerOfAllThings);

    if (devourerOfAllThings.consumes(b)) {
      food.remove(i); 
      devourerOfAllThings.grow();
    }
  }
}


class BlackHole {
  PImage ye;
  PVector loc;
  float sz;

  BlackHole() {
    loc = new PVector(random(width), random(height));
    sz = 5;
  }

  void display() {
    ye = loadImage("ye.jpg");
    image(ye, mouseX, mouseY, ye.width*.2, ye.height*.2);
  }

  boolean consumes(BouncyBall food) {
    if (loc.dist(food.loc) < sz/2 + food.sz/2) {
      return true;
    } else {
      return false;
    }
  }

  void grow() {
    sz+=1;
  }
}
class BouncyBall {
  PVector loc, vel, acc;
  float sz;
  float speed;
  float hue;

  BouncyBall(float tempsz, float tempspeed) {
    sz = tempsz;
    speed = tempspeed;
    loc = new PVector(random(sz, width-sz), random(sz, height-sz));
    vel = PVector.random2D();
    acc = new PVector();
    vel.setMag(speed);
  }

  void display() {
    PImage kim;
    kim=loadImage("kim.jpg");
    image(kim, loc.x, loc.y, kim.height*.2, kim.width*.2);
  }
  void move() {
    vel.add(acc);
    loc.add(vel);
  }
  void wallBounce() {
    if (loc.x + sz/2 > width) {
      vel.x = -abs(vel.x);
    } 
    if (loc.x - sz/2 < 0) {
      vel.x = abs(vel.x);
    }
    if (loc.y + sz/2 > height) {
      vel.y = -abs(vel.y);
    }
    if (loc.y - sz/2 < 0) {
      vel.y = abs(vel.y);
    }
  }

  void collideWith(BouncyBall other) {
    if (loc.dist(other.loc) < sz/2 + other.sz/2) {
      vel = PVector.sub(loc, other.loc);
      vel.setMag(speed);
    }
  }
  void goAway() {
    loc.set(width*10, height*10);
    vel.set(0, 0);
  }
  void teleport() {
    loc.set(mouseX, mouseY);
    vel = PVector.random2D();
  }

  void isSuckedIn(BlackHole doom) {
    acc = PVector.sub(doom.loc, loc);
    acc.setMag(.1);
  }
}





//count for how many Kim's have been consumed
//kim's get smaller/dimmer when they kollide
//kim's age and get smaller/dimmer

