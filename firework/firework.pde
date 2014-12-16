//behavior of fireworks
//particles go up and out and come back down

ArrayList<Particle> allMyParticles = new ArrayList<Particle>();

void setup(){
  noStroke();
  size(800,600);
}
void draw(){
 if(mousePressed){
   allMyParticles.add(new Particle());
 }
 background(0);
 for(int i= allMyParticles.size()-1; i>-0;i--){
   Particle currentParticle=allMyParticles.get(i);
  currentParticle.display();
  currentParticle.move();
if(currentParticle.loc.y > height + currentParticle.sz/2){
  allMyParticles.remove(i);
}
}
}

class Particle{
  PVector loc,vel,acc;
float sz;


Particle (){
loc=new PVector(width/2, height*.1);
 vel=new PVector(random(-3,3),random(-4,-2));
acc=new PVector(0,.1);
sz=10;
}

void display(){
  ellipse(loc.x,loc.y,sz,sz);
}

void move(){
    vel.add(acc);
  loc.add(vel);
}
}

