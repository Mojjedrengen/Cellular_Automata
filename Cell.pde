class Cell {
  int [] cells;  
  int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};
  int w = 10;
  int generation = 0;

  Cell() {
    cells = new int[width/w];
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
  }

  void simulate() {
    int[] newcells = new int[cells.length]; 

    for (int i = 1; i < cells.length-1; i++) {
      int left   = cells[i-1];
      int middle = cells[i];
      int right  = cells[i+1]; 
      newcells[i] = rules(left, middle, right);
    }
    cells = newcells;
    generation++;
  }

  int rules(int _l, int _mid, int _r) {
    String s = "" + _l + _mid + _r;

    int index = Integer.parseInt(s, 2);

    return ruleset[index];
  }

  void cellDraw() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(0);
      else               fill(255);
      rect(i*w, generation*w, w, w);
    }
  }
}
