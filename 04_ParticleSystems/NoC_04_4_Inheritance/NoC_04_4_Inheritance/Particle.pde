/* 
Particle class has a lifespan
Generated as part of an ArrayList and spits out at a random angle from the loc
*/

class Particle{
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  
  Particle(PVector l){
    loc = l.copy();
    vel = new PVector(0, 0);
    acc = new PVector(random(-0.1, 0.1), -0.05);
    lifespan = 255;
    
  }
  
  void update(){
    loc.add(vel);
    vel.add(acc);
    //acc.mult(0);
    lifespan -= 2;
  }
  
  void display(){
    fill(155,lifespan);
    strokeWeight(3);
    stroke(255, lifespan);
    ellipse(loc.x, loc.y, 20, 20);
    
  }
  
  boolean isDead(){
    if (lifespan <= 0){
      return true;
    } else {
      return false;
    }
  }
  
  
}
