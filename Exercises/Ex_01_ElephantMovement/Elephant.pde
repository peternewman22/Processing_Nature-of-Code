/* 
Elephant will move with Polar Coordinates

x = r*cos(angle)
y = r*sin(angle)

angle and r are driven by perlin noise
angle lots of range
r smaller range

*/
class Elephant{

  PVector loc;
  PVector vel;
  PVector acc;
  float threshold;
  
  
  Elephant(float startX, float startY){
    loc = new PVector(startX, startY);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    threshold = 50; //this is the radius inside of which the elephant runs from the mouse
  }
  
  void update(float r_, float angle_){
    
    //calculate escape route
    PVector mouse = new PVector(mouseX, mouseY);
    PVector runAway = PVector.sub(loc, mouse);
    
    //set acc to add the vector
    
    acc.x = r_*cos(angle_);
    acc.y = r_*sin(angle_);
    
    vel.add(acc);
    loc.add(vel);
    
    acc.mult(0);
  }
  
  void display(){
    fill(150);
    stroke(255);
    strokeWeight(5);
    ellipse(loc.x, loc.y, 20, 20);
    
  }
  
  void check_edge(){
    if (loc.x < 0 || loc.x > width){
      vel.x *= -1;
    }
    if (loc.y < 0 || loc.y > height){
      vel.y *= -1;
    }
  }
  
  boolean too_close(PVector runAway_){
    // checks if the mouse is close enough
    // subtract a PVector
    
    if (runAway_.mag() < threshold){
      return true;
    } else {
      return false;
    }
    
  }
 
  
  
}
