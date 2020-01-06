Mover m;

void setup(){
  size(640,360);
  m = new Mover();
}

void draw(){
  background(255);
  
  PVector gravity = new PVector(0, 0.1);
  m.applyForce(gravity);
  
  // Apply wind only when mouseclicked
  if (mousePressed){
    PVector wind = new PVector(0.2, 0);
    m.applyForce(wind);
    }
  
  
  m.update();
  m.edges();
  m.display();
  
}
