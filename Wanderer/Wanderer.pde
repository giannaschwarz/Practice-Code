PVector loc;
PVector vel;
PVector acc;
int sz= 50;
void setup(){
  size(800,600);
loc=new PVector(width/2,height/2);
vel=new PVector(0,0);
acc=new PVector(random(-.1,.1),random(-.1,.1));
}
  void draw(){
    acc.set(random(-.1,.1), random(-.1,.1));
    fill(frameCount%360,100,100);
  vel.add(acc);
  vel.limit(5);
  loc.add(vel);
  ellipse(loc.x,loc.y,sz,sz);
    if(loc.x-sz/2>width){
      loc.x=-sz/2;
    }
    if(loc.x+sz/2<0){
      loc.x=width+sz/2;
    }
    if(loc.y-sz/2>height){
      loc.y=-sz/2;
    }
    if(loc.y+sz/2<0){
      loc.y=height+sz/2;
    }
  }
    void mousePressed(){
      accx=random(-.1,.1);
      accy=random(-.1,.1);
    }


