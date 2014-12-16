ArrayList<Particle> allMyParticles = new ArrayList<Particle>();

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  BlackHoleYe = new BlackHole();
  noStroke();
}

void draw() {
  background(360);
 BlackHoleYe.display();
    if (mousePressed) {
    allMyParticles.add(new Particle());
  }
  background(0);
  for (int i= allMyParticles.size ()-1; i>=0; i--) {
    Particle currentParticle=allMyParticles.get(i);
    currentParticle.display();
    currentParticle.move();
    if (currentParticle.isDead()) {
      allMyParticles.remove(i);
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

  boolean consumes(Particle food) {
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

//behavior of fireworks
//particles go up and out and come back down

class Particle {
  PVector loc, vel, acc;
  float sz;


  Particle () {
    loc=new PVector(width/2, height*.1);
    vel=new PVector(random(-3, 3), random(-4, -2));
    acc=new PVector(0, .1);
    sz=10;
  }

  void display() {
    PImage kim;
    kim=loadImage("kim.jpg");
    image(kim,loc.x,loc.y,kim.height*.2,kim.width*.2);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
  }
  
  boolean isDead(){
    if(loc.y - sz/2 >height){
      return true;
    } else {
      return false;
    }
  }
}



//count for how many Kim's have been consumed
//kim's get smaller/dimmer when they kollide
//kim's age and get smaller/dimmer

