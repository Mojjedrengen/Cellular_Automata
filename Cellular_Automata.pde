Cell cell;

void setup() {
  //size(1250, 1250);
  fullScreen();
  cell = new Cell();
}

void draw() {
  cell.cellDraw();
  cell.simulate();
}

void mousePressed() {
 cell.restart(); 
}
