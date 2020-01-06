class Vehicle {
  PVector acc, vel, loc;
  float r, desiredseparation, maxSpeed, maxForce ;
  Vehicle(PVector loc_) {
    loc = loc_.copy();
    vel = PVector.random2D(); //unit vector in some random orientation
    acc = new PVector(0, 0);
    r = 10;
    desiredseparation = 50;
    maxSpeed = 3;
    maxForce = 0.02;
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void separate(ArrayList<Vehicle> vs){
    // find the average vector away from all others
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles){
      // are there any vehicles that are too close?
      float d = PVector.dist(loc, other.loc);
      // if it's not me...
      if((d > 0) && (d < desiredseparation)){
        //make a vector that points away
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        //the closer the thing is, the faster we should accelerate
        diff.div(d);
        //add vectors and increment count
        sum.add(diff);
        count ++;
      }
      if (count > 0){
        sum.div(count);
        sum.setMag(maxSpeed);
        PVector steer = PVector.sub(sum, vel);
        steer.limit(maxForce);
        applyForce(steer);
      }
    }
  }
  
  void applyForce(PVector f){
    acc.add(f);
  }

  void display() {
    float theta = vel.heading() + PI/2;
    fill(175);
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
  
  void border(){
  //if loc is off the map, wrap it around
    if(loc.x < 0){
      loc.x = width;
    }
    if(loc.x > width){
      loc.x = 0;
    }
    if(loc.y < 0){
      loc.y = height;
    }
    if(loc.y > height){
      loc.y = 0;
    }
  
  }
  
}
