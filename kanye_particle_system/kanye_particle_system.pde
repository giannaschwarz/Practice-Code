void setup(){
  background(250);
  size(1000,1000);
}

void draw(){
  
}
////////////////KOLLIDING KIM KARDASHIAN CLASS///////////////
///kim aging=smaller, dimmer; kim kolliding=smaller,dimmer

class Kim {
  float sz;
  PVector loc,vel;
  
  Kim(){
    sz=50;
    loc=new PVector(width/2,height/2);
    vel=PVector.random2D();
  }
  void display(){
    ellipse(loc.x,loc.y,sz,sz);
  }
  void move(){
    loc.add(vel);
  }
//make kanye as black hole
class BlackHoleYe{
  PImage ye;
  ye= loadImage("ye.jpg");
  PVector loc;
  float sz;
  
  BlackHoleYe(){
    loc=new PVector(random(width),random(height));
    sz=5;
  }
  
  void display(){
   image(ye,mouseX,mouseY,ye,ye);
  }
  
  //black hole Kanye consumes Kim's energy
  void consumes(Kim food){
    if(loc.dist(food.loc)<sz/2+food.sz/2){
      food.teleport();
      //Kanye's ego increases at alarming rate
      sz+=food.sz/100;
    }
  }
}






















