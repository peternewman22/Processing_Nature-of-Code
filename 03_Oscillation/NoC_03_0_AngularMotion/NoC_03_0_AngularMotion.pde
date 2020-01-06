float a = 0.0;
float aVel = 0.0;
float aAcc = 0.01;

void settings(){
  size(640, 340);
}

void setup(){
}

void draw(){
  background(0);
  
  // to get angular motion, we need to increase the angle each time
  a += aVel;
  aVel += aAcc;
  
  rectMode(CENTER);
  stroke(155);
  fill(255);
  // we need the origin to be the centre of the rect
  translate(width/2, height/2);
  rotate(a);
  // centremode: (x, y, width, height)
  rect(0,0,64,36);
  
}
