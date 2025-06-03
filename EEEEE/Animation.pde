public class Animation extends Event {
  PVector pos;
  int range;

  public Animation(int d, PVector p, int r) {
    super(d);
    
    pos = p;
    range = r;
  }

  public void run() {
    fill(#0000FF);
    circle(pos.x, pos.y, range);
    duration--;
  }

  public int getD() {
    return duration;
  }
}
