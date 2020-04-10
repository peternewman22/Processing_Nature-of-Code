String alphabet;
DNA[] population;


void setup(){
  size(200, 200);
  alphabet = "abcdefghijklmnopqrstuvwxyz";
  generateWord(3);
  population = new DNA[100];

}

void draw(){
  background(0);
}

String generateLetter(){
  int ix = int(random(1,27));
  return alphabet.substring(ix,ix+1);
}

void generateWord(int wLength){
  String[] w = new String[wLength];
  for(int i = 0; i < wLength; i++){
    w[i] = generateLetter();
  }
  print(join(w,""));
}
