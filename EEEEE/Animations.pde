public class Animations {
  private ArrayList<Animation> animate = new ArrayList<Animation>();

  public Animations() {
  }

  public void add(Animation a) {
    animate.add(a);
  }

  public void run() {
    for (int i = 0; i < animate.size(); i++) {
      Animation a = animate.get(i);
      if (a.getD() <= 0) {
        animate.remove(i);
        i--;
      } else {
        a.run();
      }
    }
  }
}
