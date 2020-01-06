Vehicle v;
PVector mouse;
Prey prey;
float offset;

void settings(){
  size(960, 960);
}

void setup(){
  v = new Vehicle(width/2, height/2);
  offset = 60;
  //mouse = new PVector(mouseX, mouseY);
  prey = new Prey(3,offset,20);
}

void draw(){
  background(0);
  //pushMatrix();
  //  translate(0,0);
  //  stroke(255);
  //  strokeWeight(1);
  //  noFill();
  //  rectMode(CORNER);
  //  rect(offset, offset, width-offset, height-offset);
  //popMatrix();
  prey.update();
  prey.display();
  
  /*
  mouse = new PVector(mouseX, mouseY);
  fill(200);
  stroke(255);
  strokeWeight(2);
  ellipse(mouseX, mouseY, 48, 48);
  */
  
  v.pursue(prey.loc, prey.vel);
  v.update();
  v.display();
}
