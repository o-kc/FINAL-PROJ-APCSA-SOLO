public class Inputs {
  ArrayList<Input> iii = new ArrayList<Input>();
  public Inputs() {
  };

  public String check(int x, int y) {
    for (int i = 0; i < iii.size(); i++) {
      if (iii.get(i).bound(x, y)) {
        return iii.get(i).getMethodCode();
      }
    }
    return "pressed invalid region!!!";
  }

  public void draw() {
    for (int i = 0; i < iii.size(); i++) {
      Input j = iii.get(i);
      fill(j.getHue());
      rect(j.getX(), j.getY(), j.getWidth(), j.getHeight());
      fill(#FFFF00);
      textSize(j.getWidth() / 2);
      text(j.getMethodCode() + " " + stats[i/2], j.getX(), j.getY());
    }
  }

  public void add(Input i) {
    iii.add(i);
  }
}
