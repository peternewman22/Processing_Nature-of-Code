  class Vehicle{
  PVector pos, vel, acc;
  float r, maxforce, maxspeed;
  
  Vehicle(PVector l, float ms, float mf){
    pos = l.copy();
    r = 3.0;
    maxspeed = ms;
    maxforce = mf;
    acc = new PVector(0,0);
    vel = new PVector(0,0);
  }
  
  public void run(){
    update();
    borders();
    display();
  }
  
  void follow(FlowField flow){
    //what direction should I go?
    PVector desired = flow.lookup(pos);
    // scale to maxspeed
    desired.mult(maxspeed);
    //Steering = disired minus velocity);
    PVector steer= PVector.sub(desired, vel);
    applyForce(steer);
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void update(){
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    // reset acc to zero
    acc.mult(0);
  }
  
  void display(){
    float theta = vel.heading()+radians(90);
    fill(175);
    stroke(255);
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      beginShape(TRIANGLES);
        vertex(0, -r*2);
        vertex(-r, r*2);
        vertex(r, r*2);
      endShape();
    popMatrix();
  }
  
  //wrap around
  void borders(){
    if(pos.x < -r) pos.x = width+r;
    if(pos.y < -r) pos.y = height+r;
    if(pos.x > width+r) pos.x = -r;
    if(pos.y > height+r) pos.y = -r;
  }
  
}
