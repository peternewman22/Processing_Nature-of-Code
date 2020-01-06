class Prey{
  PVector vel;
  PVector loc;
  float speed;
  float offset;
  float fatness;
  
  Prey(float speed_, float offset_, float fatness_){
      speed = speed_;
      vel = new PVector(speed,0);
      loc = new PVector(offset,offset);
      offset = offset_;
      fatness = fatness_;
   }
  
  void update(){
    //if (frameCount%5 == 0){
    //print("Prey velocity: ["+str(vel.x)+", "+str(vel.y)+"]");
    //print("Prey location: ["+str(loc.x)+", "+str(loc.y)+"]");
    //}
    
    // insert logic here
    if ((vel.x > 0) && (loc.x + speed > width - offset)){
        vel = new PVector(0,speed);
    } else if ((vel.y > 0) && (loc.y + speed > height - offset)){
        vel = new PVector(-speed, 0);
      
    } else if ((vel.x < 0) && (loc.x - speed < offset)){
        vel = new PVector(0,-speed);
    } else if ((vel.y < 0) && (loc.y + speed < offset)){
        vel = new PVector(speed,0);
    }
    
    loc.add(vel);
  }
  
  void display(){
    rectMode(CENTER);
    stroke(255);
    strokeWeight(2);
    fill(155);
    rect(loc.x, loc.y, fatness, fatness);
  }
}
