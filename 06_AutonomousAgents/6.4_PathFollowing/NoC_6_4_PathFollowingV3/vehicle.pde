class Vehicle {

  PVector loc, vel, acc;
  float r, maxSteeringForce, maxSpeed, predDist, targetDist;
  boolean offScreen;
  

  Vehicle(PVector l, float ms, float mf) {
    maxSteeringForce = mf;
    maxSpeed = ms;
    loc = l.copy();
    vel = new PVector(1, 0);
    acc = new PVector(0, 0);
    r = 10;
    offScreen = false;
    predDist = 100;
    targetDist = 50;
  }

  void run() {
    update();
    display();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
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

  void follow(Path p) {
    PVector predict = vel.copy();
    predict.setMag(predDist);
    PVector predictLoc = PVector.add(loc, predict);
    fill(255);
    ellipse(predictLoc.x, predictLoc.y, 5, 5);
    PVector a = p.start;
    PVector b = p.end;

    PVector normalPoint = getNormalPoint(predictLoc, a, b);

    PVector dir = PVector.sub(b, a);
    dir.normalize();
    dir.mult(targetDist);
    PVector target = PVector.add(normalPoint, dir);
    stroke(255);
    strokeWeight(1);
    line(predictLoc.x, predictLoc.y, target.x, target.y);
    float distance = PVector.dist(predictLoc, normalPoint);
    if (distance > p.radius/2) {
      seek(target);
    }
  }

  PVector getNormalPoint(PVector l, PVector a_, PVector b_) {
    PVector p = l.copy();
    PVector a = a_.copy();
    PVector b  = b_.copy();
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }

  void seek(PVector target_) {
    PVector desired = PVector.sub(target_, loc);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxSteeringForce);
    applyForce(steer);
  }

  void applyForce(PVector f) {
    acc.add(f);
  }
  
  void borders(){
    if(loc.x > width){
      offScreen = true;
    }
  }
}
