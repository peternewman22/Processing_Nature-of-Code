ArrayList<Koch> current;

void setup() {
  fullScreen();
  current = new ArrayList<Koch>();
  PVector start = new PVector(0, height*(2/3.0));
  PVector end = new PVector(width, height*(2/3.0));
  current.add(new Koch(start, end));
}

void draw() {
  background(255);
  for (Koch l : current) {
    l.display();
  }
}

void keyPressed() {
  if (key == ' ') {
    generate();
  }
}

void generate() {
  ArrayList next = new ArrayList<Koch>();
  for (Koch l : current) {
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();

    next.add(new Koch(a, b));
    next.add(new Koch(b, c));
    next.add(new Koch(c, d));
    next.add(new Koch(d, e));
  }
  current = next;
}
