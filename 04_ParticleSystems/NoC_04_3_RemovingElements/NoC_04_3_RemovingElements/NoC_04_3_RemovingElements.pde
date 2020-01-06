ArrayList<Particle> particles;

void settings(){
  size(640, 360);
}

void setup(){
  particles = new ArrayList<Particle>();
}

void draw(){
  background(0);
  particles.add(new Particle(new PVector(width/2, 20)));
  
  // we're removing elements from the front of the list...
  // so we don't accidentally skip one, we go backwards through the list
  for (int i = particles.size()-1; i >= 0; i--){
    Particle p = particles.get(i);
    p.update();
    p.display();
    if (p.isDead()){
      particles.remove(i);
    }
  }
  
}
