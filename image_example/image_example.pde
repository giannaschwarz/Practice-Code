PImage johnnyDepp;
void setup(){
  size(800,600);
  johnnyDepp=loadImage("johnnydepp.jpg");
}
void draw(){
  background(255);
  image(johnnyDepp,mouseX,mouseY,johnnyDepp.width*.2,johnnyDepp.height*.2);
}
