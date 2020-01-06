CA_2D ca;

void setup(){
size(1280, 720);
ca = new CA_2D();
stroke(0);
strokeWeight(1);
fill(255);

}

void draw(){
  ca.display();
  ca.update();
  delay(500);
}
