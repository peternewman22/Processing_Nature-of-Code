class CA2D {

  int w, cols, rows;
  int[][] current;

  CA2D() {
    w = 10;
    cols = width/w;
    rows = height/w;
    current = new int[cols][rows];

    //initialise a random variable in each thing
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        current[x][y] = int(random(2));
      }
    }
  }

  void display() {
    //iterate through the current board
    for (int x = 0; x < cols; x++) {
      for (int y= 0; y < rows; y++) {
        // change colour depending on value of cell
        if (current[x][y] == 0) {  
          fill(255);
        } else {
          fill(0);
        }
        // draw a rectangle at that position
        rect(x*w, y*w, w, w);
      }
    }
  }

  void update() {
    // make a buffer board
    int[][] next = new int[cols][rows];

    //iterate through the current board, ignoring the borders
    for (int x = 1; x < cols - 1; x++) {
      for (int y = 1; y < rows - 1; y++) {
        //start a count for neighbours
        int neighbours = 0;

        //start a miniloop to check for neightbours at index -1, 0, 1
        for (int i = -1; i < 2; i++) {
          for (int j = -1; j < 2; j++) {
            neighbours += current[x+i][y+j];
          }
        }

        //subtract the current value of the cell
        neighbours -= current[x][y];

        //calculate the new value
        if ((current[x][y] == 1) && (neighbours > 3)) {
          next[x][y] = 0;
        } else if ((current[x][y] == 1) && (neighbours < 2)) {
          next[x][y] = 0;
        } else if ((current[x][y] == 0) && (neighbours == 3)) {
          next[x][y] = 1;
        } else next[x][y] = current[x][y];
      }
    }

    //overwrite the current state with the new state
    current = next;
  }
}
