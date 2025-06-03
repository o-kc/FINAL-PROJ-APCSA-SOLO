public class Emitter extends Animation {
  private ArrayList<Ring> render = new ArrayList<Ring>();

  private float xStat, increment;
  private color hue;
  public Emitter(int d, PVector p, int r, float i, color c) {
    super(d, p, r);
    xStat = 0;
    increment = i;
    hue = c;
  }

  @Override
    public void run() {
    loadPixels();
    for (int i = 0; i<render.size(); i++) {
      Ring pulse = render.get(i);
      pulse.BresenhamCircle(pos);
      if (pulse.getR() >= range) {
        render.remove(i);
        i--;
      } else {
        pulse.fd();
      }
    }
    updatePixels();
    render.add(new Ring(0, cos(xStat) * 200, hue));
    xStat += increment;
    duration--;
  }
}
