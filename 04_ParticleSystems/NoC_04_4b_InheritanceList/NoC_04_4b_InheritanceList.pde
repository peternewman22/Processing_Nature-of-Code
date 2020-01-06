ArrayList<ParticleSystem> psList;

void settings(){
  size(640, 360);
}

void setup(){
  psList = new ArrayList<ParticleSystem>();
  for (int i = 0; i < 3; i++){
    // create a particle system with random origin in lower half of the screen
    ParticleSystem ps = new ParticleSystem(random(0, width), random(height/2, height));
    //add it to the list
    psList.add(ps);
  }
}

void draw(){
  // iterate over the ParticleSystems in psList and draw everything
  background(0);
  for (ParticleSystem ps : psList){
    ps.addParticle();
    ps.run();
  }
}
