float r = 150;
float a = 0.0;
float aVel = 0.0;
float aAcc = 0.01;
float t = 0.0;

void settings(){
  size(640,340);
}

void setup(){

}

void draw(){
  
  background(0);
  
  //move coord system to centre
  translate(width/2, height/2);
  
  //calculate x, y
  float x = r * cos(a);
  float y = r * sin(a);
  
  fill(255);
  stroke(255);
  line(0,0, x, y);
  ellipse(x, y, 50, 50);
  
  //adding angular acceleration/velocity
  a += aVel;
  aVel += aAcc;
  aVel = constrain(aVel, 0, 0.1);
  
  //adding perlin noise to the radius
  float perlin_n = noise(t);
  float r_change = map(perlin_n, 0.0, 1.0, -5,5);
  r += r_change;
  r = constrain(r,0,200);
  
  t += 0.01;
}
