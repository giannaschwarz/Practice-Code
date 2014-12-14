//Ball b;      //declare Ball b
;   //declare and intialize array b
void setup() {
  size(800, 600);
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
for (int i=0; i<b.length; i++){
  b= new BouncyBall();
}
}

void draw() {
  background(0);
  for (int i = 0; i < b.length; i++) {
    b[i].display();
    b[i].move();
    b[i].bounce();
  }
}




class BouncyBall {
  //declare variables
  PVector loc, vel, acc;
  float sz;
  float hue;
  float speed;
  
  BouncyBall(float tempsz, float tempsz) {
    //intialize variables
    sz=tempsz;
    speed=tempspeed;
   loc = new PVector (random(sz,width-sz),random(sz,height-ssz));
    vel = PVector.random2D();
    acc = new PVector();
    hue = random(360);
    vel.setMag(speed);
  }
  void display() {
    fill(hue, 100, 100, 100);
    ellipse(loc.x, loc.y, sz, sz);
  }
void move(){
  vel.add(acc);
  loc.add(vel);
}
void wallBounce(){
  if(loc.x+sz/2>width){
    vel.x=-abs(vel.x);
  }
  if(loc.x-sz/2<0){
    vel.x=-abs(vel.y);
  }
  if(loc.y+sz/2>height){
    vel.y=-abs(vel.y);
  }
  if(loc.y-sz/2<0){
    vel.y=abs(vel.y);
  }
}
void collideWith(Ball other){
  if(loc.dist(other.loc)<sz/2+other.sz/2){
    vel=Pvector.sub(loc,other.loc);
    vel.setMag(speed);
  }
}
void goAway(){
  loc.set(width*10,height*10);
  vel.set(0,0);
}
void teleport(){
  loc.set(mousex,mouseY);
  vel=PVector.random2D();
}
void isSuckedIn(BlackHole doom){
  acc=PVector.sub(doom.loc,loc);
  acc.setMag(.1);
}
}





class BlackHole{
  PVector loc;
  float sz;
  
  BlackHole(){
    loc=new PVector(random(width),random(height));
    sz=5;
  }
  void display(){
    fill(0);
    stroke(frameCount%360,100,100);
    strokeWeight(3);
    ellipse(loc.xmloc.y,sz,sz);
  }
  boolean consumes(BouncyBall food){
    if(loc.dist(food.loc)<sz/2+food.sz/2){
      return true;
    } else {
      return false;
    }
  }
  void grow(){
    sz+=1;
  }
}
