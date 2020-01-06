Particle p;

void settings(){
  size(640, 360);
}

void setup(){
  p = new Particle(new PVector(width/2, 20));

}

void draw(){
  background(255);
  p.update();
  p.display();
  if (p.isDead()){
    background(255,0,0);
  }
}
