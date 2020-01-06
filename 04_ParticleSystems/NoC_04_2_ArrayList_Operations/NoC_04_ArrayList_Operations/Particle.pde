class Particle{
  PVector vel;
  PVector acc;
  PVector loc;
  float lifespan;
  
  Particle(PVector l){
    vel = new PVector(0, 0);
    acc = new PVector(random(-0.1, 0.1), 0.03);
    loc = l.copy();
    lifespan = 255;
  }
  
  void update(){
    loc.add(vel);
    vel.add(acc);
    lifespan -= 2;
    
  }
  
  void display(){
    stroke(255, lifespan);
    strokeWeight(2);
    fill(155, lifespan);
    ellipse(loc.x, loc.y, 20, 20);
  }
}
