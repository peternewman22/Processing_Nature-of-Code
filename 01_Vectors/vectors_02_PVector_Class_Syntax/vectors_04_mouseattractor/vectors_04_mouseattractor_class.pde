class Attractor{
  // Declare variables
  PVector mouse;
  PVector ball;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lim;
  float str;

  // Constructor
  Attractor(){
    lim = 15;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    }
  
  void update(){
    // first we construct a mouse vector
    mouse = new PVector(mouseX,mouseY);
    
    // then we calculate an acceleration vector from location to mouse
    acceleration = mouse.sub(location);
    // set the str of accel based on distance from the mouse
    // gravity model: inversely proportional
    //str = 5/acceleration.mag();
    
    //spring model: F = k*x
    str = 0.01*acceleration.mag();
    
    acceleration.setMag(str);
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(lim);
  }
  
  void bounce(){
    if ((location.x > width) || (location.x < 0)){
      velocity.x *= -1;
    }
    if ((location.y > height) || (location.y < 0)){
      velocity.y *= -1;
    }
  }

  void render(){
    background(255);
    line(location.x, location.y, mouseX, mouseY);
    ellipse(location.x, location.y, 48, 48);
  }
}
