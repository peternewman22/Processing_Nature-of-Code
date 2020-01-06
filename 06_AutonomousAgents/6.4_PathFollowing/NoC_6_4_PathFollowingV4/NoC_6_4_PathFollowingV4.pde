Path p;
ArrayList<Vehicle> vehicles;
Vehicle v; 


void setup() {
  size(1280, 1280);
  p = new Path();
  vehicles = new ArrayList<Vehicle>();
  v = new Vehicle(new PVector(width/4, height/4), 2, 0.05);
  vehicles.add(v);
}

void draw() {
  background(0);
  p.display();
  text(vehicles.size(), width/2, height/8);
  for (Vehicle car : vehicles) {
    car.follow(p);
    car.run();
    car.borders();
  }
  for(int i = vehicles.size()-1; i >= 0; i--){
    if(vehicles.get(i).offScreen){
      vehicles.remove(i);
    }
  }
}

void mousePressed() {
  vehicles.add(new Vehicle(new PVector(mouseX, mouseY), 2, 0.02));
}

void mouseDragged() {
}
