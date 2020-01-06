import shiffman.box2d.*;



ArrayList<Box> boxes;

Box2DProcessing box2d;

void settings(){
  size(640, 340);
}

void setup(){
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boxes = new ArrayList<Box>();
}

void draw(){
  background(0);
  
  box2d.step();
  
  if (mousePressed){
    box2d p = new Box(mouseX, mouseY);
    boxes.add(p);
  }
  
  //display all the boxes
  for (Box b : boxes){
    
  }
}
