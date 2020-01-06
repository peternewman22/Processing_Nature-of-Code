/*
Once we have displayed that generation, add it to the history
 */


class CA {
  int[] cells;
  int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};
  int w = 10;
  int generation = 0;
  int[][] history;
  int maxgen = height/w;
  boolean filled_screen;

  CA() {
    cells = new int[width/w];
    cells[cells.length/2] = 1; //set the middle thing to 1
    filled_screen = false;
    history = new int[maxgen][cells.length]; //i = generation, j = cell_state;
    /*
    //set the state to same random number
     for(int i = 0; i < cells.length; i++){
     cells[i] = int(random(2));
     */
  }


  void generate() {
    int[] nextgen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) { //ignoring the ends
      int left  = cells[i-1];
      int mid = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left, mid, right);
    }
    //store cells in history
    if (generation<maxgen) {
      history[generation] = cells; //store the old generation 
      cells = nextgen; //update to the new generation
      generation++; //iterate the generation
    } else {
      //turn filled_screen to true
      filled_screen = true;
      // make a new history
      int[][] new_history = new int[maxgen][cells.length]; 
      arrayCopy(history, 1, new_history); //copy old array to the new array
      new_history[maxgen] = cells; //store the last generation in the last element of the array
      history = new_history;
    }
  }

  int rules(int a, int b, int c) {
    String s = "" + a + b + c;
    int ix = Integer.parseInt(s, 2);
    return(ruleset[ix]);
  }

  void display() {
    for (int i = 0; i < maxgen; i++) {
      for (int j = 0; j < cells.length; j++) {
        if (cells[i] == 1) fill(0);
        else              fill(255);
      }   
      rect(j*w, height-i*w, w, w); //determine the y pos by generation (i);
    }
  }
}
