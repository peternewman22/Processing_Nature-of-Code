/*
I want a line segment with ellipses at either end
 */


void settings() {
  size(1280, 1280);
}

void setup() {
}

void draw() {
  background(0);
  stroke(255);
  fill(255);
  strokeWeight(2);
  PVector p = new PVector(mouseX, mouseY);
  PVector a = new PVector(width/8, 4*height/5);
  PVector b = new PVector(7*width/8, 4*height/5);
  line(width/8, 4*height/5, 7*width/8, 4*height/5);
  ellipse(a.x, a.y, 5, 5);
  ellipse(b.x, b.y, 5, 5);
  line(a.x, a.y, p.x, p.y);
  ellipse(p.x, p.y, 5, 5);
  PVector norm = scalarProj(p, a, b);
  fill(255, 0, 0);
  ellipse(norm.x, norm.y, 10, 10);
  line(p.x, p.y, norm.x, norm.y);
  
}


PVector scalarProj(PVector p, PVector a, PVector b) {
  PVector ap = PVector.sub(p, a);
  PVector ab = PVector.sub(b, a);
  ab.normalize();
  ab.mult(ap.dot(ab));
  PVector normalPoint = PVector.add(a, ab);
  return normalPoint;
}
