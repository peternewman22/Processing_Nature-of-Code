
/*
I want a 1D array with different states stored in it
 */
CA ca;

void setup() {
  size(1080, 720);
  stroke(0);
  strokeWeight(1);
  ca = new CA();
}

void draw() {
  ca.display();
  ca.generate();
  
}
