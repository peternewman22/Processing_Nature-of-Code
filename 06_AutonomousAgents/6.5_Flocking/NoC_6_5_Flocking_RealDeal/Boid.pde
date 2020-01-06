class Boid {
  PVector loc, vel, acc;
  float r, maxSpeed, maxForce, desiredseparation, neighbourdist;
  boolean offScreen;
  
  Boid(PVector loc_) {
    loc = loc_.copy();
    vel = PVector.random2D(); // random direction
    acc = new PVector(0, 0);
    r = 10;
    maxSpeed = 2;
    maxForce = 0.02;
    neighbourdist = 50;
    offScreen = false;
    desiredseparation = 50;
  }

  void run(ArrayList<Boid> boids){
    flock(boids);
    update();
    display();
    border();
  }

  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);
    PVector ali = align(boids);
    PVector coh = cohesion(boids);

    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
  }

  PVector separate(ArrayList<Boid> boids) {
    PVector sum = new PVector();
    int count = 0;
    //look at all the other boids
    for (Boid other : boids) {
      float d = PVector.dist(loc, other.loc); //find distance
      if ((d > 0) && (d < desiredseparation)) { //if not me
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        diff.div(d); // the closer the other is, the faster we should move
        sum.add(diff); //add it to the collective and iterate count
        count ++;
      }
    }
    if (count > 0) { //if there are more than 0 boids nearby
      sum.div(count); //calculate the average
      sum.setMag(maxSpeed);
      PVector steer = PVector.sub(sum, vel); // steering force
      steer.limit(maxForce); //moderated
      return steer;
    } else {
      PVector steer = new PVector(0, 0);
      return steer;
    }
  }

  PVector align(ArrayList<Boid> boids) {
    PVector sum = new PVector(0, 0); 
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(loc, other.loc);
      if ((d > 0) && (d < neighbourdist)) {
        sum.add(other.vel);
        count ++;
      }
    }
    if (count > 0) {
      sum.div(count); //find the average velocity
      sum.setMag(maxSpeed);
      PVector steer = PVector.sub(sum, vel); // steer in that direction
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector cohesion(ArrayList<Boid> boids) {
    int count = 0;
    PVector sum = new PVector(0, 0);
    for(Boid other : boids){
      float d = PVector.dist(loc, other.loc); 
      if ((d > 0) && (d < neighbourdist)){
        sum.add(other.loc);
        count ++;
      }
    }
    if (count > 0){
      sum.div(count);
      return seek(sum); // seek the average position of neighbours
    } else {
      return new PVector(0,0);
    }
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, loc);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    return steer;
  }

  void applyForce(PVector f) {
    acc.add(f);
  }


  void update() {
    vel.add(acc);
    loc.add(vel);
    if((loc.x > width) || (loc.x < 0) || (loc.y > height) || (loc.y < 0)){
      offScreen = true;
    }
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

  void border() {
    if (loc.x < 0) {
      loc.x = width;
      loc.y = height - loc.y;
    }
    if (loc.x > width) {
      loc.x = 0;
      loc.y = height - loc.y;
    }
    if (loc.y < 0) {
      loc.y = height;
      loc.x = width - loc.x;
    }
    if (loc.y > height) {
      loc.y = 0;
      loc.x = width - loc.x;
    }
  }
}
