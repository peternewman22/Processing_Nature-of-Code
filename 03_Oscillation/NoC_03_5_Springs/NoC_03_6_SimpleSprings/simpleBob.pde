class Bob{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float restLength;
  
  Bob(float startX, float startY, float mass_, float rest_len, float init_disp){
    loc = new PVector(startX, startY + rest_len + init_disp);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    restLength = rest_len;
    mass = mass_;
  }
  
  void applyForce(PVector f){
    PVector force = PVector.div(f, mass); //scale F by mass
    acc.add(force);
  }
  
  
  void update(){
    loc.add(vel);
    vel.add(acc);
    acc.mult(0); //reset acceleration
    vel.mult(0.95);
  }
  
  void display(){
    fill(0);
    stroke(255);
    strokeWeight(5);
    ellipse(loc.x, loc.y, mass*20, mass*20);
  }
    
}
