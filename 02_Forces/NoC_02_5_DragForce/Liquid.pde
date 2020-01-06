class Liquid{
  // var dec
  float x,y,w,h;
  float c; //this is the drag force constant
  //
  
  //Initialize
  Liquid(float x_, float y_, float w_, float h_, float c_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  PVector dragForce(Mover m){
    float dragMag = m.vel.magSq();
    PVector dragF = m.vel.copy();
    dragF.mult(-1);
    dragF.normalize();
    dragF.mult(c * dragMag);
    return dragF;
  }
  
  // the display function is going to draw the drag material rectangle
  void display(){
    noStroke();
    fill(150);
    rect(x,y,w,h);
  }
  
  
  
}
  
