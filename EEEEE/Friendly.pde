public class Friendly extends Bullet {
  public Friendly(PVector pos, PVector v, int spdLim, float a) {
    super(pos, v, spdLim, a);
  }

  public void move() {
    super.move();
  }
  @Override
    public void collide() {
    for (int i = 0; i < ships.size(); i++) {
      if (pos.dist(ships.get(i).getPos()) < 20) {
        System.out.println("e");
        ships.remove(i);
        animate.add(new Animation(20, pos.copy(), (int) (Math.random() * 80)));
        i--;
      }
    }
  }
}
