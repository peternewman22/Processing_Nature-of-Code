class Mover{
  // Declarations
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  //constructor
  Mover(){
    loc = new PVector(random(width), 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = random(1,2);
  }
  
  //apply Newton's 2nd law with mass
  void applyForce(PVector f){
    // create a new instance of f
    PVector force = PVector.div(f,mass);
    acc.add(force);
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
    ellipse(loc.x, loc.y, mass*20, mass*20);
  }
  
}
