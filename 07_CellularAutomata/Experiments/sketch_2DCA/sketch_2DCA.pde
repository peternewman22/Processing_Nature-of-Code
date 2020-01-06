CA2D ca2d;
void setup(){
  fullScreen();
  ca2d = new CA2D();
}

void draw(){
  ca2d.display();
  ca2d.update();
}

//void mouseClicked(){
//  ca2d.update();
//}
