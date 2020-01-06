class CA {
  int[] cells;
  int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};
  int w = 10;
  int generation = 0;

  CA() {
    cells = new int[width/w];
    //cells[cells.length/2] = 1; //set the middle thing to 1
    for(int i = 0; i < cells.length; i++){
      cells[i] = int(random(2));
      //set the state to same random number
    }
  }

  void generate() {
    int[] nextgen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) { //ignoring the ends
      int left  = cells[i-1];
      int mid = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left, mid, right);
    }
    cells = nextgen;
    generation++;
  }

  int rules(int a, int b, int c) {
    String s = "" + a + b + c;
    int ix = Integer.parseInt(s, 2);
    return(ruleset[ix]);
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(0);
      else              fill(255);
      rect(i*w, generation*w, w, w); //determine the y pos by generation;
    }
  }
}
