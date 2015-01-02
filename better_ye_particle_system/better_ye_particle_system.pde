//array list of kim particles
ArrayList<Particle> allMyParticles = new ArrayList<Particle>();
//declare blackHoleYe
BlackHole blackHoleYe;
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  //intialize blackHoleYe
  blackHoleYe = new BlackHole();
  noStroke();
  imageMode(CENTER);
}

void draw() {
  background(360);
  blackHoleYe.display();
  //add new kim particles when mouse is pressed
  if (mousePressed) {
    allMyParticles.add(new Particle());
  }
  //add particles, move the particles, shrink the particles
  for (int i= allMyParticles.size ()-1; i>=0; i--) {
    Particle currentParticle=allMyParticles.get(i);
    currentParticle.display();
    currentParticle.move();
    currentParticle.update();
    //when particle is dead (has to do with life/lifespan), just remove particle
    if (currentParticle.isDead()) {
      allMyParticles.remove(i);
    }
    //if kim particle touches blackHoleYe..
    if (blackHoleYe.consumes(currentParticle)) {
      //...kim is removed (kanye eats her)...
      allMyParticles.remove(i);
      //kanye's head then grows, symbolizing his ego growing (key concept of program)
      blackHoleYe.grow();
    }
  }
}


//create class for Kanye the Blackhole (of despair and ego)
class BlackHole {
  //declare pimage, location, size
  PImage ye;
  PVector loc;
  float sz;

  BlackHole() {
    //intialize location at random point within constraints, size at 10, and load image of kanye
    loc = new PVector(random(width*.25, width*.75), random(height*.25, height));
    sz = 10;
    ye = loadImage("ye.jpg");
  }

  void display() {
    //display visually appealing image of kanye
    image(ye, loc.x, loc.y, sz, sz*1.61);
  }

  boolean consumes(Particle food) {
    //if particle kim touches kanye, kanye will consume her, if she stays in her own lane and doesn't touch kanye, she is not consumed
    if (loc.dist(food.loc) < sz/2 + food.sz/2) {
      return true;
    } else {
      return false;
    }
  }

  void grow() {
    //the rate at which kanye's head grows when he consumes a kim particle
    sz+=5;
  }
}


class Particle {
  // declaring variables loc, vel, acc, sz, life, lifespan, and kim (for image)
  PVector loc, vel, acc;
  float sz;
  PImage kim;
  float life, lifespan;
  //tried opacity, but it just wasn't working right for me
//  float opacity;
  

  Particle () {
    //behavior of fireworks
//particles go up and out and come back down
    loc=new PVector(width/2, height*.1);
    vel=new PVector(random(-3, 3), random(-4, -2));
    acc=new PVector(0, .1);
    //size of kim particles
    sz=35;
    //loading actual image of crying kim kardashian
    kim=loadImage("kim.jpg");
    //initializing lifespan and life
    lifespan=random(1, 1000);
    life=lifespan;
      //tried opacity, but it just wasn't working right for me
//    opacity=255;
  }

  void display() {
      //tried opacity, but it just wasn't working right for me
//  tint(360,opacity);
//displaying kim particles with her image
    image(kim, loc.x, loc.y, sz*1.56, sz);
  }

  void move() {
//moving kim particles using velocity, acceleration, location
    vel.add(acc);
    loc.add(vel);
  }

  boolean isDead() {
    //how to tell if kim particle is dead
    if (loc.y - sz/2 >height || sz<=0) {
      //if she goes off the screen, particle is dead
      return true;
    } else {
      //if she doesn't go off the screen, particle is not dead
      return false;
    }
  }
  void update() {
    //life decreases by 1, symbolizing kim's aging
    life-=1;
    sz = map(life, 0, lifespan, 0, 35);
 //   opacity= map(life,0,lifespan,0,opacity);
  }
}

//////////tried planning out a few things before//////
//count for how many Kim's have been consumed
//kim's get smaller/dimmer when they kollide
//kim's age and get smaller/dimmer

