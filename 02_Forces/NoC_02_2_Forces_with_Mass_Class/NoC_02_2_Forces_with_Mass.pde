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
  
  // Apply wind only when mouseclicked
    if (mousePressed){
      PVector wind = new PVector(0.2, 0);
      m.applyForce(wind);
     }  
  m.update();
  m.edges();
  m.display();
  }
}
