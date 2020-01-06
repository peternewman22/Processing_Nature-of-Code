class Particle{
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  float mass;
  
  Particle(PVector l){
    loc = l.copy();
    vel = new PVector(0, 0);
    acc = new PVector(random(-1, 1), 0);
    lifespan = 255;
    float r = random(1);
    if (r < 0.1){
      mass = 3;
    } else {
      mass = 0.25;
      }
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    lifespan -= 2;
  }
  
  void applyForce(PVector force){
    PVector mforce = PVector.div(force, mass);
    acc.add(mforce);
  }
  
  void display(){
    stroke(255, lifespan);
    strokeWeight(2);
    fill(155, lifespan);
    ellipse(loc.x, loc.y, 20, 20);
  }
  
  boolean isDead(){
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height){
      return true;
    } else {
      return false;
    }
  }
}
