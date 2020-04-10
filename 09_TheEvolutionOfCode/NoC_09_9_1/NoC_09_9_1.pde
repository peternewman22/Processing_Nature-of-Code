String alphabet;
DNA[] population;
ArrayList<DNA> matingPool;
float mutationRate;
String target;


void setup() {
  size(200, 200);
  alphabet = "abcdefghijklmnopqrstuvwxyz";
  generateWord(3);
  population = new DNA[100];
  for (int i =0; i < population.length; i++) {
    population[i] = new DNA();
  }
  mutationRate = 0.01;
  target = "to be or not to be";
}

void draw() {
  background(0);
  // calculate all the fitnesses for each of the population
  for (int i = 0; i < population.length; i++) {
    population[i].fitness();
  }

  // generate the mating pool
  generateMatingPool();

  // reproduction
  for (int i = 0; i < population.length; i++) {
    //pick at random from the mating pool
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    // keep choosing b if they're the same until we get one 
    while (a != b) {
      b = int(random(matingPool.size()));
    }
    DNA partnerA = matingPool.get(a);
    DNA partnerB = matingPool.get(b);
    DNA child = partnerA.crossover(partnerB);
    child.mutate();
    population[i] = child;
  }
  
  
  
}

String generateLetter() {
  int ix = int(random(1, 27));
  return alphabet.substring(ix, ix+1);
}

void generateWord(int wLength) {
  String[] w = new String[wLength];
  for (int i = 0; i < wLength; i++) {
    w[i] = generateLetter();
  }
  print(join(w, ""));
}

void generateMatingPool() {
  matingPool = new ArrayList<DNA>();
  for (int i= 0; i < population.length; i++) {
    int n = int(population[i].fitness * 100);
    for (int j = 0; j < n; j++) {
      matingPool.add(population[j]);
    }
  }
}

void generateMatingPoolMonteCarlo() {
  matingPool = new ArrayList<DNA>();
  // I'm going to use the fitness as the monte carlo qualifying method
  for (int i = 0; i < population.length; i++) {
    if ( random(1) < population[i].fitness) {
      matingPool.add(population[j]);
    }
  }
}

void generateMatingPoolRankMethod() {
  matingPool = new ArrayList<DNA>();
}
