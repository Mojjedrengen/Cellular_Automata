Cell cell;

void setup() {
  size(1000, 700);
  cell = new Cell();
}

void draw() {
  cell.cellDraw();
  cell.simulate();
}

void mousePressed() {
 cell.restart(); 
}
