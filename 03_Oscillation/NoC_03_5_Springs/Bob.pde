class Mover{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  
  Mover(float x_, float y_){
    float x = x_;
    float y = y_;
    loc = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = 1;
  }

  void applyForce(PVector f){
     PVector force = PVector.div(f,mass);
     acc.add(force);
  }
  
  void update(){
  
  }
  
  void display(){
  
  }

}
