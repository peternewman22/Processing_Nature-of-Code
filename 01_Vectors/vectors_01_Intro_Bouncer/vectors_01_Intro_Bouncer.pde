int width = 600;
int height = 400;
float x = width/2;
float y = height/2;
float xspeed = 5;
float yspeed = 5;
float ballsize = 48;

void setup(){
  size(600,400);
}

void draw(){
  background(255);
  x = x + xspeed;
  y = y + yspeed;
  

  if ((x > width - ballsize/2) || (x < ballsize/2)){
    xspeed = xspeed * -1;
  }
  
  if ((y > height - ballsize/2) || (y < ballsize/2)){
    yspeed = yspeed * -1;
  }
  stroke(0);
  strokeWeight(2);
  fill(127);
  ellipse(x,y,ballsize,ballsize);
}
