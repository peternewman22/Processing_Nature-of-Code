class Path {

  PVector start, end;
  float radius;

  Path() {
    radius = 100;
    start = new PVector(0, height/3);
    end = new PVector(width, 2*height/3);
  }

  void display() {
    stroke(255, 100);
    strokeWeight(radius);
    line(start.x, start.y, end.x, end.y);
    strokeWeight(2);
    stroke(255);
    line(start.x, start.y, end.x, end.y);
  }
}
