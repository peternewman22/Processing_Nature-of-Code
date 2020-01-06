class Mover{
  // declaring variables
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  PVector f_copy;
  
  //constructor
  Mover(){
  loc = new PVector(width/2, 100);
  vel = new PVector(0,0);
  acc = new PVector(2,0);
  mass = 1;
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    // always make sure you reset the acc or they'll just accumulate to infinite
    acc.mult(0);
  }
  
  void applyForce(PVector f){
    PVector f_copy = PVector.div(f, mass);
    acc.add(f_copy);
  }
  
  void check_edges(){
  if ((loc.x > width) || (loc.x < 0)){
    vel.x *= -1;
  }
  if ((loc.y > height) || (loc.y < 0)){
    vel.y *= -1;
  }
  }
  
  void display(){
    ellipse(loc.x, loc.y, mass*20, mass*20);
  }
  
}
