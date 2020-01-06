class Oscillator{

  // dec var
  float amplitude;
  float period;
  float offset;
  float ang_freq;
  PVector loc;
  float FC;
  
  Oscillator(float amp_, float period_, float offset_, float ang_freq_){
   FC = 0;
   amplitude = amp_;
   period = (frameCount / period_) * TWO_PI;
   offset = offset_;
   ang_freq = ang_freq_;
   loc = new PVector(0, 0); // can refactor later to set the y value etc...
   }
  
  void update(){
    //calculate the x position
    
  }
  
  void display(){
    float x = amplitude * sin(ang_freq * (FC/period)*TWO_PI + offset);
    stroke(255);
    fill(0);
    strokeWeight(10);
    // draw a line from the centre of the screen to the x position along the x axis
    line(0,0,x,0);
    // draw an ellipse at the end of the line
    ellipse(x, 0, 60, 60);
  }

}
