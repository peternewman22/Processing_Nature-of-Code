
/*
I want a 1D array with different states stored in it
 */
int[] cells = {1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0};
int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};
int[] history;
void setup() {
  size(1080, 720);
  stroke(0);
  strokeWeight(1);
}

void draw() {
  background(255);

  for (int i = 0; i < cells.length; i++) {
    if (cells[i] == 0) {
      fill(255);
    } else {
      fill(0);
    }
    rect(40+i*50, height/2, 50, 50);
  }

  //storing the newcells
  int[] newcells = new int[cells.length];
  for (int i = 1; i < newcells.length-1; i++) {
    int left = cells[i-1];
    int middle = cells[i];
    int right = cells[i+1];
    int newstate = rules(left, middle, right);
    newcells[i] = newstate;
  }

  //overwrite initial cell states
  cells = newcells;
}

int rules(int left, int middle, int right) {
  String s = ""+left+middle+right;
  int index = Integer.parseInt(s, 2); //base 2
  return(ruleset[index]);
}
