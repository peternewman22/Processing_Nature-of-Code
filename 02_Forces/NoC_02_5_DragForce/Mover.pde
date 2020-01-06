class Mover{
  // var dec
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  PVector grav;
  
  //init
  Mover(){
    loc = new PVector(random(0,width),0);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = random(0.1,2);
  
  }
  
  Boolean inLiquid(Liquid l){
    if (loc.x > l.x && loc.x < l.x + l.w && loc.y > l.y && loc.y < l.y + l.h){
      return true;
    } else {
      return false;
    }
  }
   
  void applyForce(PVector f){
    PVector force = f.copy();
    f.div(mass);
    acc.add(f);
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void display(){
    stroke(0);
    fill(100);
    ellipse(loc.x, loc.y, mass*20, mass*20);
  }

}
