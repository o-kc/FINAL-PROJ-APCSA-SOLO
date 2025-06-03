public class Ring {
  private int r;
  private float amp;
  private color hue;

  public Ring(int r, float amp, color c) {
    this.r = r;
    this.amp = amp;
    hue = c;
  }

  public void BresenhamCircle(PVector centre) {
    int x = 0;
    int y = r;
    int d = 3 - 2 * r;

    while (y >= x) {
      plot((int) centre.x, (int) centre.y, x, y);
      x++;
      if (d < 0) {
        d = d + 4 * x + 6;
      } else {
        d = d + 4 * (x - y) + 10;
        y--;
      }
    }
  }

  public void plot(int p, int q, int x, int y) {
    pixellate(p+x, q-y);
    pixellate(p-x, q+y);
    pixellate(p-x, q-y);
    pixellate(p+x, q+y);
    pixellate(p+y, q-x);
    pixellate(p-y, q+x);
    pixellate(p-y, q-x);
    pixellate(p+y, q+x);
  }

  public void pixellate(int x, int y) {
    if (x >= 0 && x < width && y >= 0 && y < height) {
      color c = pixels[width * y + x];
      pixels[width * y + x] = color(red(c) + red(hue) / 255 * amp, green(c) + green(hue) / 255 * amp, blue(c) +  blue(hue) / 255 * amp);
    }
  }

  public int getR() {
    return r;
  }

  public void fd() {
    r++;
  }
}
