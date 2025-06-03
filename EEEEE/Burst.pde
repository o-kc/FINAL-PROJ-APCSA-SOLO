public class Burst extends Event {
  private int prevSpd = one.getMaxSpeed();
  public Burst(int d, int s) {
    super(d);
    one.setMaxSpeed(one.getMaxSpeed() + s);
  }

  public void run() {
    one.setMaxSpeed(prevSpd);
  }
}
