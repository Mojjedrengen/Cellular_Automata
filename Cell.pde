class Cell {
  int columns;
  int rows;
  int[][] board;

  int w = 10;
  int generation = 0;

  Cell() {
    columns = width/w;
    rows = height/w;

    board = new int[columns][rows];
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        int temp = int(random(2));
        board[x][y] = temp;
      }
    }
  }

  void simulate() {
    int[][] next = new int[columns][rows];
    for (int x = 1; x < columns-1; x++) {
      for (int y = 1; y < rows-1; y++) {
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += board[x+i][y+j];
          }
        }
        neighbors -= board[x][y];

        if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;
        else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;
        else next[x][y] = board[x][y];
      }
    }
    board = next;
  }

  void cellDraw() {
    for ( int i = 0; i < columns; i++) {
      for ( int j = 0; j < rows; j++) {

        // Black when state = 1
        if ((board[i][j] == 1)) fill(0);
        // White when state = 0
        else fill(255);
        stroke(0);

        rect(i*w, j*w, w, w);
      }
    }
  }

  void restart() {
    columns = width/w;
    rows = height/w;

    board = new int[columns][rows];
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        int temp = int(random(2));
        board[x][y] = temp;
      }
    }
  }
}
