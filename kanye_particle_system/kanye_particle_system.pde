void setup(){
  
}

void draw(){
  
}

//make kanye as black hole
class BlackHoleYe{
  PVector loc;
  float sz;
  
  BlackHoleYe(){
    loc=new PVector(random(width),random(height));
    sz=5;
  }
  
  void display(){
    fill(0);
    ellipse(loc.x,loc.y,sz,sz);
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
