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

void setup(){
  size(1280, 1280);
  path = new Path();
}

void draw(){
  background(0);
  path.display();
}
