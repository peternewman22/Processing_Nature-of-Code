class Box {

  Body body;
  
  float x,y;
  float w,h;
  
  //init
  Box(float x_, float y_){
    x = x_;
    y = y_;
    
    w = 16;
    h = 16;
    
    //Step 1: Define Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    //because Box2D deals with NOT PIXELS..
    bd.position.set(box2d.coordPixelToWorld(x,y));
    
    //Step 2: Create Body
    body = box2d.createBody(bd);
    
    //Step 3: Create Shape
    PolygonShape ps = new PolygonShape();
    ps.setAsBox(w, h);
    
    //Step 4: Create Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    //Step 5: Bring it all together
  }

void display(){
  fill(127)
  
}



}
