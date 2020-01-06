/*
We're going to be using scalar projection to check that 
we're an appropriate distance from the path

1. Check "future" location
2. Is future location on the path?
  if yes --> do nothing
  if no...
3. Find the normal to the path (scalar proj)
4. Move the target along the path using the future pos
5. Seek target
*/

Path path;
ArrayList<Vehicle> vehicles;

void settings(){
  size(480, 480);
}

void setup(){
  path = new Path();
  //setup the array
  vehicles = new ArrayList<Vehicle>();
  
  
}

void draw(){
  background(255);
  path.display();
  
  for (Vehicle car : vehicles){
    car.follow(path);
    car.run();
    car.borders(path);
  }
}

void mousePressed(){
    vehicles.add(new Vehicle(new PVector(mouseX, mouseY), 2.0, 0.02));
}

void mouseDragged(){
  
}
