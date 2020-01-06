float theta;

void setup() {
  size(640, 360);
  theta = PI/6;
  stroke(0);
  strokeWeight(2);
}

void draw() {
  background(255);
  //theta = map(mouseX, 0, width, 0, PI/2);
  branch(60);
}

void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);

  len *= 0.66;

  if (len > 2) {
    pushMatrix();
    rotate(theta);
    branch(len);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}

/* 
 Psuedocode
 //translate
 translate(width/2, height); // translate to the bottom
 line(0, 0, 0, -150);
 translate(0, -150);
 
 //branch right
 pushMatrix();
 rotate(PI/4);
 line(0, 0, 0, -100);
 popMatrix();
 
 //branch left
 pushMatrix();
 rotate(-PI/4);
 line(0, 0, 0, -100);
 popMatrix();
 */
