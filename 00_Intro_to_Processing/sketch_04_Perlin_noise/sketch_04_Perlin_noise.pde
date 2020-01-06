float t_x = 0;
float t_y = 0;
float inc = 0.01;
void setup(){
  size(600,400);
}

void draw(){
  background(0);
  fill(255);
  
  t_x = t_x + inc;
  t_y = t_y + 0.5*inc;
  
  float x = noise(t_x);
  x = map(x,0,1,0,width);
  
  float y = noise(t_y);
  y = map(y,0,1,0,height);
  ellipse(x,y,40,40);
  
}
