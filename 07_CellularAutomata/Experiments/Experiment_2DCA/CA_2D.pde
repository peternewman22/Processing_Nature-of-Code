class CA_2D {

  int[][] current;
  int w = 20;
  int cols = width/w;
  int rows = height/w;


  CA_2D() {
    current = new int[cols][rows]; //make a board
    println("cols: ", cols, ", rows: ", rows);
    //init random
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        current[x][y] = int(random(2));
      }
    }
  }

  void update() {
    int[][] nextstate = new int[cols][rows];
    //skipping the edges
    for (int x = 1; x < cols-1; x++) {
      for (int y = 1; y < rows-1; y++) {
        //check all neighbours
        int neighbours = 0;
          for (int i = -1; i < 1; i++) {
          for (int j = -1; j < 1; j++) {
            neighbours += current[x+i][y+j];
          }
        }
        neighbours -= current[x][y]; //don't count yourself

        if ((current[x][y] == 1) && (neighbours < 2)) nextstate[x][y] = 0;
        else if ((current[x][y] == 1) && (neighbours > 3)) nextstate[x][y] = 0;
        else if ((current[x][y] == 0) && (neighbours == 3)) nextstate[x][y] = 1;
        else nextstate[x][y] = current[x][y]; //other cases: stay the same
      }
    }
    current = nextstate;
  }

  void display() {
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y< rows; y++) {
        if((current[x][y] == 1)) fill(0);
        else fill(255);

        rect(x*w, y*w, w, w);
      }
    }
  }
}
