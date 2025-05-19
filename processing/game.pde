int w;
int h;
int size2;
color[] p;
Cell[] cells = new Cell[10];

void setup() {
  size(800, 600);
  size2 = 20;
  w = width / size2;
  h = height / size2;
  p = new color[w * h];
  projectColorGrid();

  for (int i = 0; i < cells.length; i++) {
    color cColor = color(random(255), random(255), random(255));
    PVector spawn = new PVector(int(random(w)), int(random(h)));
    cells[i] = new Cell(10, cColor, spawn);
  }
}

void projectColorGrid() {
  loadPixels();
  for (int i = 0; i < h; i++) {
    for (int j = 0; j < w; j++) {
      p[i * w + j] = #FFFFFF;
    }
  }
}

void drawGrid() {
  strokeWeight(0.1);
  for (int i = 0; i < h; i++) {
    for (int j = 0; j < w; j++) {
      fill(p[i * w + j]);
      square(j * size2, i * size2, size2);
    }
  }
}

void draw() {
  drawGrid();
  for (Cell c : cells) {
    c.spread();
  }
}
