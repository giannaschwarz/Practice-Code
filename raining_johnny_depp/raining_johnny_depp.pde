int count=800;
PImage johnnyDepp;
PVector[] loc=new PVector[count];
PVector[] vel=new PVector[count];
PVector[] acc=new PVector[count];
float[] sz=new float[count];
float[] theta=new float[count];
float[] spin=new float[count];

void setup(){
  size(800,600);
  imageMode(CENTER);
  johnnyDepp=loadImage("johnnydepp.jpg");
  for(int i=0; i<count; i++){
    sz[i]=random(40,100);
    loc[i]=new PVector(random(width),random(-height*1.5,-sz[i]/2));
    vel[i]=new PVector(0,random(1));
    acc[i]=new PVector(0,.01);
    theta[i]=random(TWO_PI);
    spin[i]=random(-.01,.01);
}
noStroke();
fill(255,200);
}
void draw(){
  background(0,20,50);
  for(int i=0; i<count; i++){
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    vel[i].limit(3);
    pushMatrix();
    translate(loc[i].x,loc[i].y);
    rotate(theta[i]);
    tint(255);
    image(johnnyDepp,0,0,sz[i],sz[i]);
    popMatrix();
    acc[i].x=random(-.05,.05);
    theta[i]+=spin[i];
    if(loc[i].y-sz[i]/2>height){
    loc[i].set(random(width),random(-height,-sz[i]/2));
    vel[i].set(0,1);
    }
  }
}
    
