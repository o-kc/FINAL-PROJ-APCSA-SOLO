ArrayList<PVector> blu = new ArrayList<PVector>();
int w;
int h;
int size2;
color[] p;
void setup() {
  size(800, 600);
  size2 = 20;
  w = width / size2;
  h = height / size2;
  p = new color[w * h];
  c();

  blu.add(new PVector((int) (Math.random() * w), (int) (Math.random() * h)));
}

void c() {
  loadPixels();
  for (int i = 0; i < h; i++) {
    for (int j = 0; j < w; j++) {
      p[i * w + j] = pixels[i * width + j * size2];
    }
  }
}

void grid() {
  strokeWeight(0.2);
  for (int i = 0; i < h; i++) {
    for (int j = 0; j < w; j++) {
      fill(p[i * w + j]);

      square(j * size2, i * size2, size2);
    }
  }
}

void draw() {
  grid();
  blu = expand(blu);
}

ArrayList<PVector> expand(ArrayList<PVector> cell) {
  ArrayList<PVector> newC = new ArrayList<PVector>();
  for (PVector i : cell) {
    if (i.y - 1 >= 0 && 255 != blue(p[((int) i.y - 1) * w + (int) i.x])) {
      p[((int) i.y - 1) * w + (int) i.x] = #0000FF;
      newC.add(new PVector(i.x, i.y - 1));
    }
    if (i.y + 1 < h && 255 != blue(p[((int) i.y + 1) * w + (int) i.x])) {
      p[((int) i.y + 1) * w + (int) i.x] = #0000FF;
      newC.add(new PVector(i.x, i.y + 1));
    }
    if (i.x - 1 >= 0 && 255 != blue(p[((int) i.y) * w + (int) i.x - 1])) {
      p[((int) i.y) * w + (int) i.x - 1] = #0000FF;
      newC.add(new PVector(i.x - 1, i.y));
    }
    if (i.x + 1 < w && 255 != blue(p[((int) i.y) * w + (int) i.x + 1])) {
      p[((int) i.y) * w + (int) i.x + 1] = #0000FF;
      newC.add(new PVector(i.x + 1, i.y));
    }
  }
  return newC;
}
