ArrayList<Particle> allMyParticles = new ArrayList<Particle>();
BlackHole blackHoleYe;
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  blackHoleYe = new BlackHole();
  noStroke();
  imageMode(CENTER);
}

void draw() {
  background(360);
  blackHoleYe.display();
  if (mousePressed) {
    allMyParticles.add(new Particle());
  }
  for (int i= allMyParticles.size ()-1; i>=0; i--) {
    Particle currentParticle=allMyParticles.get(i);
    currentParticle.display();
    currentParticle.move();
    currentParticle.update();
    if (currentParticle.isDead()) {
      allMyParticles.remove(i);
    }
    if (blackHoleYe.consumes(currentParticle)) {
      allMyParticles.remove(i);
      blackHoleYe.grow();
    }
  }
}



class BlackHole {
  PImage ye;
  PVector loc;
  float sz;

  BlackHole() {
    loc = new PVector(random(width*.25, width*.75), random(height*.25, height));
    sz = 10;
    ye = loadImage("ye.jpg");
  }

  void display() {
    image(ye, loc.x, loc.y, sz, sz*1.61);
  }

  boolean consumes(Particle food) {
    if (loc.dist(food.loc) < sz/2 + food.sz/2) {
      return true;
    } else {
      return false;
    }
  }

  void grow() {
    sz+=5;
  }
}

//behavior of fireworks
//particles go up and out and come back down

class Particle {
  PVector loc, vel, acc;
  float sz;
  PImage kim;
  float life, lifespan;
  

  Particle () {
    loc=new PVector(width/2, height*.1);
    vel=new PVector(random(-3, 3), random(-4, -2));
    acc=new PVector(0, .1);
    sz=35;
    kim=loadImage("kim.jpg");
    lifespan=random(1, 1000);
    life=lifespan;
  }

  void display() {
//    tint(360,opacity);
    image(kim, loc.x, loc.y, sz*1.56, sz);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
  }

  boolean isDead() {
    if (loc.y - sz/2 >height || sz<=0) {
      return true;
    } else {
      return false;
    }
  }
  void update() {
    life-=1;
    sz = map(life, 0, lifespan, 0, 35);
  }
}



//count for how many Kim's have been consumed
//kim's get smaller/dimmer when they kollide
//kim's age and get smaller/dimmer

