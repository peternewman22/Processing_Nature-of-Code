Bob b;
PVector origin;

void settings(){
  size(360, 640);
}

void setup(){
  origin = new PVector(width/2, 0);
  b = new Bob(origin.x, origin.y, 2, 200, 50);
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(3);
  line(origin.x, origin.y, b.loc.x, b.loc.y);
  //calculating spring force
  PVector spring = PVector.sub(b.loc, origin);
  float currentLength = spring.mag();
  spring.normalize();
  float k = 0.01;
  float displacement = currentLength - b.restLength;
  PVector springForce = spring.mult(-k * displacement);
  
  b.applyForce(springForce);
  
  PVector wind = new PVector(0.1, 0);
  if (mousePressed){
    b.applyForce(wind);
  }
  
  PVector gravity = new PVector(0, 0.1);
  b.applyForce(gravity);
  
  
  b.update(); //update location
  b.display();
}
