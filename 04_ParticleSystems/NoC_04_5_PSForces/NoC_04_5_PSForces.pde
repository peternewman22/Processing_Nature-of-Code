ParticleSystem ps;
PVector source_;
void settings(){
  size(640, 360);
}

void setup(){
  source_ = new PVector(width/2, height*0.25);
  ps = new ParticleSystem(source_);
}

void draw(){
  background(0);
  
  ps.addParticle();
   
  if (mousePressed){
    float windStrength = 0.001*(mouseX -width/2);
    PVector wind = new PVector(windStrength, 0);
    ps.applyForce(wind);
  }
  
  
  PVector gravity = new PVector(0, 0.001);
  ps.applyGravity(gravity);
  
 
  
  

  ps.run();

}
