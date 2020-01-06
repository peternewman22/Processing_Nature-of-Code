void setup(){
  size(500, 300);
}

void draw(){
  background(255);
  strokeWeight(2);
  stroke(0);
  noFill();
  // move the marker to the centre of the screen
  translate(width/2,height/2);
  ellipse(0,0,4,4);
  
  PVector mouse = new PVector(mouseX,mouseY);
  PVector centre = new PVector(width/2, height/2);
  mouse.sub(centre);
  //mouse.mult(1.5);
  //return the magntide of a vector and use it to draw a rectangle
  //float m = mouse.mag();
  //fill(255,0,0);
  //rect(0,0,m,20);
  
  //normalising is great, because then you can scale it
  mouse.normalize();
  mouse.mult(50);
  
  line(0,0,mouse.x,mouse.y);
}
