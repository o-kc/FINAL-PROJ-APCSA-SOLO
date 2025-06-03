public class Explosion extends Animation {
  int count;

  public Explosion(int d, PVector p, int s, int c) {
    super(d, p, s);
    count = c;
  }

  @Override

    public void run() {
    for (int i = 0; i < count; i++) {
      float x = cos(random(TWO_PI)) * random(range/2);
      float y = sin(random(TWO_PI)) * random(range/2);
      PVector p = pos.copy().add(new PVector(x, y));
      fill(#FFFFFF);
      square(p.x, p.y, 20);
    }
    duration--;
  }
}
