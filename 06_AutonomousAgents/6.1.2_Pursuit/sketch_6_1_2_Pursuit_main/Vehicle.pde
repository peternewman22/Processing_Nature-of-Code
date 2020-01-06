class Vehicle{
  
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxForce;
  float maxSpeed;
  float predictive_power;
  
  
  Vehicle(float x, float y){
    acc = new PVector(0, 0);
    vel = new PVector(0, -2);
    loc = new PVector(x, y);
    r = 6;
    maxSpeed = 5;
    maxForce = 0.1;
    predictive_power = 20;
       
  }
  
  void update(){
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    acc.mult(0);
     
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  PVector predict(PVector prey_loc, PVector prey_vel){
    PVector future_displacement = prey_vel.copy().mult(predictive_power);
    PVector predicted_loc = prey_loc.copy().add(future_displacement);
    return predicted_loc;
  }
  
  // this function should be called during the draw loop
  void show_prediction(PVector loc_){
    stroke(255,0,0,155);
    strokeWeight(2);
    noFill();
    rectMode(CENTER);
    rect(loc_.x, loc_.y, 20, 20);
  }
  
  void pursue(PVector loc_, PVector vel_){
    // predict the location
    PVector predicted_loc = predict(loc_, vel_);
    // show the prediction
    show_prediction(predicted_loc);
    
    // to the steering behaviour
    PVector desired = PVector.sub(predicted_loc, loc);
    
    desired.setMag(maxSpeed);
    
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    
    applyForce(steer);
    
  }
  

  
  /*
  void seek(PVector target){
    // extrapolate
    
    PVector desired = PVector.sub(target, loc);
    
    desired.normalize();
    desired.mult(maxSpeed);
    // can also use desired.setMag(maxSpeed);
    
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    
    applyForce(steer);
  }
  */
  
  void display(){
    float theta = vel.heading() + PI/2;
    fill(100);
    stroke(255);
    pushMatrix();
      translate(loc.x, loc.y);
      rotate(theta);
      beginShape();
        vertex(0, -r*2);
        vertex(-r, r*2);
        vertex(r, r*2);
       endShape(CLOSE);
      popMatrix();
  }
}
