ParticleSystem ps;

void settings(){
  size(640, 360);
}

void setup(){
  ps = new ParticleSystem(width/2, height/2);
}

void draw(){
  background(0);
  ps.addParticle();
  ps.run();
  }
  
