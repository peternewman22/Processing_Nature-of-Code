Attractor a;

void setup(){
  size(600,400);
  a = new Attractor();
}

void draw(){
  a.update();
  a.bounce();
  a.render();
  //println("location.x =",a.location.x,"location.y =",a.location.y, "mouseX =",a.mouse.x,"mouseY = ",a.mouse.y);
}
