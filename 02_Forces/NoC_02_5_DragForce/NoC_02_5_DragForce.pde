// declare variables
Mover[] movers;
Liquid liquid;

void settings(){
  size(640,360);
}

void setup(){
  liquid = new Liquid(0, height/2, width, height/2, 0.04);
  movers = new Mover[5];
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw(){
  background(255);
  liquid.display();
  
  for (Mover m : movers){
    // if inLiquid, apply the drag force
    if (m.inLiquid(liquid)){
      //println("inLiquid: True");
      PVector dragF = liquid.dragForce(m);
      m.applyForce(dragF);
    } else {
    println("inLiquid: False");
    }
    
    //quicktest: appy drag with mouseclick
    /*
    if (mousePressed){
      //println("mousePressed = True!");
      PVector dragF = liquid.dragForce(m);
      m.applyForce(dragF);
    } else {
    //println("mousePressed = False!");
    }
   */
   
   
   //another test: building up to mouse pos on screen
   /*
   if (mouseX > liquid.x && mouseX < liquid.x + liquid.w && mouseY > liquid.y && mouseY < liquid.y + liquid.h){
    PVector dragF = liquid.dragForce(m);
    m.applyForce(dragF);
   }
   */
    
    //apply grav
    float gravF = 0.1 * m.mass;
    PVector grav = new PVector(0, gravF);
    m.applyForce(grav);
    
    m.update();
    m.display();
  }
}
