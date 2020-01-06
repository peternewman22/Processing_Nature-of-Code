class Path{

  PVector start;
  PVector end;
  
  float radius;
  
  Path(){
    radius = 100;
    start = new PVector(0, height/3);
    end = new PVector(width, 2*height/3);
  }
  
  void display(){
    //path radius
    strokeWeight(radius/2);
    stroke(255,100);
    line(start.x, start.y, end.x, end.y);
    
    //path line
    strokeWeight(1);
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }


}
