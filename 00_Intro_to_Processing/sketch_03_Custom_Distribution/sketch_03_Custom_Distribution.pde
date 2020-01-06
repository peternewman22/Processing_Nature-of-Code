float[] vals;
float[] norms;

void setup(){
  size(400,300);
  vals = new float[width];
  norms = new float[width];
}

void draw(){
  background(100);
  
  // Pick a random number between 0 and 1 based on a custom distributions
  float n = montecarlo();
  
  // What spot in the array did we pick?
  int index = int(n*width);
  vals[index]++;
  stroke(255);
  
  boolean normalization = false;
  float maxy = 0.0;
  
  // Draw graph based on values in norms array
  // If a value is greater than the height, set normal
  for (int x = 0; x < vals.length; x++){
    line(x, height, x, height-norms[x]);
    if (vals[x] > height) normalization = true;
    if (vals[x] > maxy) maxy = vals[x];
  }
  
  // If normalization is true, then normalize to height
  // Otherwise, just copy info
  for (int x = 0; x < vals.length; x++){
    if (normalization) norms[x] = (vals[x] / maxy) * 1;
  }
}

float montecarlo() { 
  boolean foundone = false;
  int hack = 0;
  while (!foundone && hack < 100000) {
    float r1 = (float) random(1);
    float r2 = (float) random(1);
    float y = r1*r1;
    if (r2 < y) {
      foundone = true;
      return r1;
    }
    hack ++;
  }
  return 0;
}
