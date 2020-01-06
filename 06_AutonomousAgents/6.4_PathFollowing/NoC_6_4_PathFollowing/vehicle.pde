class Vehicle{
  
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  
  Vehicle(PVector loc_, float maxSpeed_, float maxForce_){
    loc = loc_;
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    maxSpeed = maxSpeed_;
    maxForce = maxForce_;
  }
  
  // Work out the future position
  
  
  void follow(Path p){
  // step 1: predict future loc
    PVector predict = vel.copy();
    predict.setMag(25);
    PVector predictLoc = PVector.add(loc, predict);
    
  // step 2: find the normal point
  PVector a = p.start;
  PVector b = p.end;
  PVector normalPoint = getNormalPoint(predictLoc, a, b);
  
  // step 3: Move along the path and set a target
  PVector dir = PVector.sub(b, a); //sets the direction along the path
  dir.setMag(10); //move 10 pixels down the path
  PVector target = PVector.add(normalPoint, dir);
  
  // step 4: if off path, seek path
  float distance = PVector.dist(normalPoint, predictLoc);
  if (distance > p.radius){
    seek(target);
  }
  
    
  }
  
   void seek(PVector target){
     PVector desired = PVector.sub(target, loc);
     
     if (desired.mag() == 0) return;
     
     desired.setMag(maxSpeed);
     
     PVector steer = PVector.sub(desired, vel);
       applyForce(steer);
   }
   
   void applyForce(PVector force){
     acc.add(force);
   }
  
  PVector getNormalPoint(PVector p, PVector a, PVector b){
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    
    PVector normalPoint = PVector.add(a,ab);
    
    return normalPoint;
  }
  
  void run(){
    
  }



}
