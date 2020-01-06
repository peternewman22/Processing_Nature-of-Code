/*
very simple vehicle
 */
class Vehicle {
  PVector loc;
  PVector vel;
  float dir;
  float r;
  boolean offscreen;
  Vehicle(PVector loc_, PVector vel_) {
    loc = loc_.copy();
    vel = vel_;
    dir = vel.heading();
    r = 20;
    offscreen = false;
  }

  void update() {
    loc.add(vel);
    if ((loc.x > width) || (loc.x < 0) || (loc.y > height) || (loc.y < 0)) {
      offscreen = true;
    }
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir);
    beginShape();
    vertex(0, r);
    vertex(3*r, 0);
    vertex(0, -r);
    vertex(0,r);
    endShape();
    popMatrix();
  }

  PVector scalarProjection(Boundary boundary) {
    PVector ap = PVector.sub(loc, boundary.start);
    fill(255, 0, 0);
    //ellipse(ap.x, ap.y, 5, 5);
    PVector ab = PVector.sub(boundary.end, boundary.start);
    ellipse(ab.x, ab.y,5,5);
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(boundary.start, ab);
    //ellipse(normalPoint.x, normalPoint.y, 5,5);
    return normalPoint;
  }

  void drawNormal(Boundary boundary) {
    PVector normalPoint = scalarProjection(boundary);
    stroke(255, 100);
    line(loc.x, loc.y, normalPoint.x, normalPoint.y);
  }
}
