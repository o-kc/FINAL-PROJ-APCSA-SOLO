public class Bullet extends Moveable {
  public Bullet(PVector pos, PVector v, int spdLim, float a) {
    super(pos, v, spdLim, a);
  }

  public void move() {
    collide();
    super.move();
    stroke(255);
    fill(#FFFF00);
    circle(pos.x, pos.y, 10);
  }

  public void collide() {
    if (one.getPos().dist(pos) < 20) {
      one.hit();
      animate.add(new Explosion(20, pos.copy(), (int) random(80), 3));
    }
  }
}
