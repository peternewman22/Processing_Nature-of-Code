class ParticleSystem{

  ArrayList<Particle> particles;
  PVector source;
  
  ParticleSystem(float xStart, float yStart){
    particles = new ArrayList<Particle>();
    source = new PVector(xStart, yStart);
  }
  
  void addParticle(){
    particles.add(new SquareParticle(source));
  }
  
  void run(){
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
}
