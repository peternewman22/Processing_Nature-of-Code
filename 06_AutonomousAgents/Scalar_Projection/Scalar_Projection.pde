void settings() {
  size(1280, 1280);
}
Boundary boundary;
ArrayList<Vehicle> vehicles;

void setup() {
  boundary = new Boundary(new PVector(0, 3*height/4), new PVector(width, 3*height/4));  
  vehicles = new ArrayList<Vehicle>();
  textSize(24);
}

void draw() {
  background(0);
  //text("number of vehicles: " + vehicles.size(),width/8, height/8);
  //draw the boundary
  boundary.show();
  //draw each vehicle
  for (Vehicle vehicle : vehicles) {
    vehicle.update();
    vehicle.show();
    vehicle.drawNormal(boundary);
  }
  // remove the vehicles that are offscreen going backwards through the list
  for(int i = vehicles.size()-1; i > 0; i--){
    if(vehicles.get(i).offscreen){
      vehicles.remove(i);
    }
  }
}

void mousePressed() {
  vehicles.add(new Vehicle(new PVector(width/2, height/2), PVector.random2D().mult(random(1, 5))));
}
