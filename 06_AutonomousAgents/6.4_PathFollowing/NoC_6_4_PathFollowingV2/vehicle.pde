class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  
  //put the vehicle at a location determined by the mouse
  //we'll randomly generate maxSpeed and maxForce at init
  Vehicle(PVector loc_, float maxSpeed_, float maxForce_) {
    loc = loc_;
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    maxSpeed = maxSpeed_;
    maxForce = maxForce_;
  }
  
  // Future position
  PVector predict(PVector vel_){
    PVector futureLoc = 
  }
  
}
