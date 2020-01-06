ArrayList<Vehicle> vehicles;

void setup() {
  size(1280, 1280);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 100; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height))));
  }
}

void draw() {
  background(0);
  for (Vehicle v : vehicles) {
    v.separate(vehicles);
    v.update();
    v.display();
    v.border();
  }
}
