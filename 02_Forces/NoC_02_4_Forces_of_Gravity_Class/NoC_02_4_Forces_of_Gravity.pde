Mover m;
Attractor a;

void settings(){
  size(640, 340);
}

void setup(){
  m = new Mover();
  a = new Attractor();
}

void draw(){
  background(255);
  // attractor, attract the mover
  PVector force = a.attract(m);
  // mover, apply that force
  m.applyForce(force);
  m.update();
  a.display();
  m.display();
  m.check_edges();
}
