float xoff;
float yoff;
Walker w;

void settings(){
  size(640, 360);
}

void setup(){
  frameRate(120);
  background(0);
  xoff = 0.0;
  yoff = 0.0;
  w = new Walker();
}


void draw(){
  float xMove = map(noise(xoff),0,1,-30,30);
  float yMove = map(noise(yoff),0,1,-30,30);
  w.update(xMove, yMove);
  w.display();
  
  xoff += 0.01;
  yoff += 0.01;
}
