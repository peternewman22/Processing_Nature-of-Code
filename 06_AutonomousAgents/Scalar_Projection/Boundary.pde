class Boundary{
  PVector start;
  PVector end;
  Boundary(PVector start_, PVector end_){
    start = start_.copy();
    end = end_.copy();
  }
  
  void show(){
    stroke(255);
    strokeWeight(5);
    line(start.x, start.y, end.x, end.y);
    
  }
}
