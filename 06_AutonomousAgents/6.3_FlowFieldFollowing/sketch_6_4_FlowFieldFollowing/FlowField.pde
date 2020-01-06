class FlowField{

  PVector[][] field;
  int cols, rows;
  int resolution;
  int offset;
  
  FlowField(int res){
    resolution = res;
    cols = width/resolution;
    rows = height/resolution;
    offset = resolution/2;
    
    field  =new PVector[cols][rows];
    
    init();
  }
  
  void init(){
    noiseSeed((int)random(10000));
    float xoff = 0;
    for (int i = 0; i < cols; i++){
      float yoff = 0;
      for (int j = 0; j < rows; j++){
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI);
        field[i][j] = new PVector(cos(theta),sin(theta));
        yoff+= 0.1;
      }
      xoff += 0.1;
    }
  }
  void drawVector(PVector v, float x, float y, float scl){
    pushMatrix();
    float arrowsize = 4;
    translate(x,y);
    stroke(255,100);
    rotate(v.heading());
    float len = v.mag()*scl;
    line(0,0,len,0);
    line(len,0,len-arrowsize,arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }
  
  PVector lookup(PVector lookup){
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].copy();
  }
  
  void show(){

    for (int i = 0; i < cols; i++){
      for (int j = 0; j < rows; j++){
        drawVector(field[i][j],i*resolution,j*resolution,resolution-2);
      }
    }
    
    
  }
  
}
