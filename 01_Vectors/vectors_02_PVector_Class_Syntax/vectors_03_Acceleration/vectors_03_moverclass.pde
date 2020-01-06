class Mover{
  // Declaring Variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  //PVector rev_x;
  //PVector rev_y;
  
  // Setup
  Mover(){
     location = new PVector(width/2,height/2);
     velocity = new PVector(0,0);
     acceleration = new PVector(0,0.01);
     //rev_x = new PVector(-1,1);
     //rev_y = new PVector(1,-1);
   }

  void update(){
    //acceleration = PVector.random2D();
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(5);
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
    ellipse(location.x, location.y, 48, 48);
  }
}
