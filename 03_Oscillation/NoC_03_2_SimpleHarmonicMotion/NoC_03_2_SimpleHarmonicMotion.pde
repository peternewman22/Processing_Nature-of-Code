/*
Note: period --> frameCount/period * 2PI
*/
Oscillator osci;

float amp = 1.0;
// 200 frames (frames per second)
float per = 200;

void settings(){
  size(640, 340);
}

void setup(){
  osci = new Oscillator(width/2,240,0,1);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  osci.FC += frameCount;
  osci.update();
  osci.display();
  
}
