class Path {

  ArrayList<PVector> points;

  float radius;

  Path() {
    radius = 100;
    points = new ArrayList<PVector>();
  }

  void addPoint(float x, float y) {
    PVector point = new PVector(x, y);
    points.add(point);
  }

  void display() {
    stroke(255);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape();
  }
}
