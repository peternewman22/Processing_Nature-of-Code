//var global dec
float amp;
//float theta;
float period;
float t;

void settings(){
  size(640, 340);
}

void setup(){
  amp = 150;
  period = 180;
  t = 0;
  //theta = 0;
}

void draw(){
  background(0);
  translate(width/2, height/2);
  float rand_offset = map(noise(t),0,1,-PI, PI);
  float x = amp * sin((frameCount / period) * TWO_PI + rand_offset);
  float y = amp * cos((frameCount / period) * TWO_PI);
  fill(0);
  stroke(255);
  strokeWeight(3);
  line(0,0,x,y);
  strokeWeight(5);
  ellipse(x,y,36,36);
  //increment theta
  //theta += 0.01;
  t += 0.001;
  
}
