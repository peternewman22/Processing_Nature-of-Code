Elephant e;
float t;

void settings() {
  size(720, 480);
}

void setup() {
  e = new Elephant(width/2, height/2);
  t = 0.0;
}

void draw() {
  background(0);

  float r = map(noise(t), 0, 1, 0.001, 0.005);
  float angle = map(noise(t), 0, 1, 0, TWO_PI);
  e.update(r, angle);
  println(r, angle, e.acc.x, e.acc.y, e.vel.x, e.vel.y);
  e.check_edge();
  e.display();

  t += 0.001;
}
