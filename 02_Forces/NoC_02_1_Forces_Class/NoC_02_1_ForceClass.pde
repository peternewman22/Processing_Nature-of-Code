class Mover{
  // Declarations
  PVector loc;
  PVector vel;
  PVector acc;
  //constructor
  Mover(){
    loc = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void applyForce(PVector f){
    acc.add(f);
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    vel.limit(15);
    acc.mult(0);
  }
  
  void edges(){
  if ((loc.x > width) || (loc.x < 0)){
    vel.x *= -1;
  }
  if ((loc.y > height) || (loc.y < 0)){
    vel.y *= -1;
  }
  }
  
  
  void display(){
    ellipse(loc.x, loc.y, 48, 48);
  }
  
}
