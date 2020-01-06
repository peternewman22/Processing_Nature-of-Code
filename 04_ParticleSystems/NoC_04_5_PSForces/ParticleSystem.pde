class ParticleSystem{
  PVector source;
  ArrayList<Particle> particles;
  
  ParticleSystem(PVector source_){
    particles = new ArrayList<Particle>();
    source = source_.copy();
  }
  
  //Because Gravity needs to be scaled by mass, we use a separate function
  void applyGravity(PVector grav){
    for (Particle p : particles){
      grav.mult(p.mass);
      p.applyForce(grav);
    }
  }
  
  void applyForce(PVector force){
    for (Particle p : particles){
      p.applyForce(force);
    }
  }
  
  void addParticle(){
    float r = random(1);
    if (r < 0.4){
    particles.add(new SquareParticle(source));
  } else {
    particles.add(new Particle(source));
  }
    
  }
 
  void run(){
    for (int i = particles.size() - 1; i >= 0; i--){
      Particle p = particles.get(i);
      p.update();
      p.display();
      if (p.isDead()){
        particles.remove(i);
      }
    }
  }
}
