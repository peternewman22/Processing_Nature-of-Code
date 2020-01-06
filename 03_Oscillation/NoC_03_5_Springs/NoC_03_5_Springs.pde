/*
Hooke's Law: F = -k * x where x is deviation from the rest length
*/

PVector origin;
Mover bob;
float restLength;
float k;

void settings(){
  size(640, 360);
}

void setup(){
  restLength = 200;
  origin = new PVector(width/2, 0);
  bob = new Mover(origin.x, origin.y + restLength);
}

void draw(){
  background(0);
  
  PVector springForce = PVector.sub(bob.loc, origin);
  springForce.normalize();
  springForce.mult(-k);
  
  line(origin.x, origin.y, bob.loc.x, bob.loc.y);
  bob.applyForce(springForce);
  bob.update();
  bob.display();
}
