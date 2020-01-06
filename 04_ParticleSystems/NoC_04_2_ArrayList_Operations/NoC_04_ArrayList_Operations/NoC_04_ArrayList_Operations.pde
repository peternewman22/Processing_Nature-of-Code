ArrayList<Particle> particleCluster;

void settings(){
  size(640, 360);
}

void setup(){
  // initialising the array list
  particleCluster = new ArrayList<Particle>();
  
  // fill it with Particles
  for (int i = 0; i < 10; i++){
    particleCluster.add(new Particle(new PVector(width/2, 20)));
  }
  

}

void draw(){
  background(0);
  for (Particle p : particleCluster){
    p.update();
    p.display();
  }
}
