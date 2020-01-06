/*
Rules of flocking:
1. Separate ("avoidance"): steer to avoid colliding with neighbours
2. Alignment ("copy"): steer in the same direction as neighbours
3. Cohesion ("center"): steer to the centre of your neighbours (stay with the group) 
*/

Flock flock;

void setup(){
  size(1280, 1280);
  flock = new Flock();
  for (int i = 0; i < 100; i++){
    Boid b = new Boid(new PVector(random(width),random(height)));
    flock.addBoid(b);
  }
}

void draw(){
  background(0);
  flock.run();
}
