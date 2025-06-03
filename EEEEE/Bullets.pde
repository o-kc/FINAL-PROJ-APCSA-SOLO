public class Bullets {
  private ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  public Bullets() {
  }

  public void add(Bullet b) {
    bullets.add(b);
  }

  public void move() {
    for (int i = 0; i < bullets.size(); i++) {
      PVector pos = bullets.get(i).getPos();
      if (pos.x < 0 || pos.x >= width || pos.y < 0 || pos.y >= height) {
        bullets.remove(i);
        i--;
      } else {
        bullets.get(i).move();
      }
    }
  }
}
