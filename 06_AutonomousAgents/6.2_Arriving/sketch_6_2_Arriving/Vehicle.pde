class Vehicle{
  
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxForce;
  float maxSpeed;
  
  
  Vehicle(float x, float y){
    acc = new PVector(0, 0);
    vel = new PVector(0, -2);
    loc = new PVector(x, y);
    r = 6;
    maxSpeed = 4;
    maxForce = 0.1;
       
  }
  
  void update(){
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    acc.mult(0);
     
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void seek(PVector target){
    // extrapolate
    
    PVector desired = PVector.sub(target, loc);
    
    desired.normalize();
    desired.mult(maxSpeed);
    // can also use desired.setMag(maxSpeed);
    
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    
    applyForce(steer);
  }
  
  void arrive(PVector target){
    PVector desired = PVector.sub(target, loc);
    float d = desired.mag();
    
    // detect if we're 100 pixels away from target
    if (d<100){
      float m = map(d, 0, 100, 0, maxSpeed);
      desired.setMag(m);
    } else { //otherwise go at max speed
      desired.setMag(maxSpeed);
    }
  
    
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  
  void display(){
    float theta = vel.heading() + PI/2;
    fill(100);
    stroke(255);
    pushMatrix();
      translate(loc.x, loc.y);
      rotate(theta);
      beginShape();
        vertex(0, -r*2);
        vertex(-r, r*2);
        vertex(r, r*2);
       endShape(CLOSE);
      popMatrix();
  }
  
  
  
}
