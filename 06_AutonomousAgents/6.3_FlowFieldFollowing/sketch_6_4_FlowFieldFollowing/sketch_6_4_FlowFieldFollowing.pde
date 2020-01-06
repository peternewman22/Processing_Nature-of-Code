FlowField field;
ArrayList<Vehicle> vehicles;

void settings(){
  size(480,480);
}

void setup(){
  field = new FlowField(10);
    noFill();
    stroke(255);
    strokeWeight(1);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 120; i++){
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(2,5), random(0.1, 0.5)));
  }
}

void draw(){
  background(0);
  field.show();
  for (Vehicle v : vehicles){
    v.follow(field);
    v.run();
  }
  
}

void mousePressed(){
  field.init();
}
