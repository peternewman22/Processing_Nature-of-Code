// make an array of Movers
Mover[] movers;

void settings(){
    size(640, 360);
}
//setup
void setup(){

  // 5 movers into the array
  movers = new Mover[5];
  // actually instantiate the movers in the array
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}


void draw(){
  background(255);
  
  // Using the enhanced loop
  for (Mover m: movers){
    
  // to get everything to fall at the same time, scale everything by mass  
    PVector gravity = new PVector(0, 0.1);
    gravity.mult(m.mass);
    m.applyForce(gravity);
    //PVector wind = new PVector(0.2, 0);
    //m.applyForce(wind);
  
  // Apply friction (using a COPY of the velocity)
  PVector friction = m.vel.copy();
  friction.normalize();
  float c = -0.01;
  friction.mult(c);
  if (mousePressed){
    m.applyForce(friction);
  }
   
    
  m.update();
  m.edges();
  m.display();
  }
}
