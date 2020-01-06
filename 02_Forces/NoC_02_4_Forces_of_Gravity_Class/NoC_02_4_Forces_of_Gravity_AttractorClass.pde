class Attractor{
  // declaring variables
  PVector loc;
  float mass;
  float G;
  
  Attractor(){
    loc = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
  }
  
  void display(){
    ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0);
    fill(175, 200);
    ellipse(loc.x, loc.y, mass*2, mass*2);
  }
  
  PVector attract(Mover m){
    
    // Find direction of force
    PVector force = PVector.sub(loc, m.loc);
    
    float d = force.mag();
    
    //adding a constraint:
    d = constrain(d,5.0,25.0);
    
    force.normalize();
    
    //Calculate the magnitude of the force
    float strength = (G * mass * m.mass) / (d * d); 
    
    // Putting mag and direction together
    force.mult(strength);
    
    return force;
  }
  
}
