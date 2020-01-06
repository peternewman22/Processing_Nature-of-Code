class SquareParticle extends Particle{
  
  float angle;
  
  SquareParticle(PVector l){
    super(l); //use the constructor from the parent
    float angle = random(0,TWO_PI);
  }
  

  void display(){
    fill(155);
    stroke(255);
    strokeWeight(3);
    rectMode(CENTER);
    pushMatrix();
      translate(loc.x, loc.y);
      rotate(angle);
      rect(loc.x, loc.y, 16, 16);
     popMatrix();
    
    angle += 0.1;
    
  }
  
}
