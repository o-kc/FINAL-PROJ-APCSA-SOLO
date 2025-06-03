public class Ripple extends Emitter {

  public Ripple(int d, PVector p, int r, float i, color c) {
    super(d, p, r, i, c);
  }

  public void run() {
    super.run();
    duration--;
  }
}
