Vehicle v;
PVector mouse;

void settings(){
  size(1080, 920);
}

void setup(){
  v = new Vehicle(width/2, height/2);
  //mouse = new PVector(mouseX, mouseY);
}

void draw(){
  background(0);
  
  mouse = new PVector(mouseX, mouseY);
  fill(200);
  stroke(255);
  strokeWeight(2);
  ellipse(mouseX, mouseY, 48, 48);
  
  v.seek(mouse);
  v.update();
  v.display();
}
