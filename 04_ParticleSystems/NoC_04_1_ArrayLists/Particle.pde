class Particle{

  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan; 
  
  
  Particle(PVector l){
    loc = l.get();
    vel = new PVector(0, 0.0);
    acc = new PVector(0, 0.05);
    lifespan = 255;
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    lifespan -= 2;
  }
  
  void display(){
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(loc.x, loc.y, 12, 12);
  }
  
  boolean isDead(){
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}
