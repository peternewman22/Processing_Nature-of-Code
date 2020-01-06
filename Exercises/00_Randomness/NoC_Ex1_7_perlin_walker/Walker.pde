class Walker{
  PVector loc;
  
  Walker(){
    loc = new PVector(width/2, height/2);
  }
  
  void update(float step_lenX, float step_lenY){
    loc.x += step_lenX;
    loc.y += step_lenY;
 }
 
 void display(){
   color(255);
   point(loc.x, loc.y);
 }
  
  
}
