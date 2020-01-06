//var dec
PVector origin;
PVector bob;
float len;
float theta;
float aVel;
float aAcc;

void settings(){
  size(640, 360);
}

void setup(){
  len = 180;
  origin = new PVector(width/2, 0);
  bob = new PVector(width/2, len);
  theta = PI/8;
  aVel = 0.0;
  aAcc = 0.0;
}

void draw(){
  background(0);
  
  //compute the position of the bob
  bob.x  = origin.x + len * sin(theta);
  bob.y = origin.y + len * cos(theta);
  
  
  fill(0);
  stroke(255);
  strokeWeight(2);
  line(origin.x, origin.y, bob.x, bob.y);
  strokeWeight(5);
  ellipse(bob.x, bob.y, 32, 32);
  
  aAcc = -1 * 0.01 * sin(theta);
  
  theta += aVel;
  aVel += aAcc;
  aVel *= 0.99; //damping effect

}
