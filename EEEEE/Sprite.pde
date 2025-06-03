class Sprite extends Moveable {
  protected int hp, resources, resourceCap;
  private int h = 20;
  private int w = 10;

  public Sprite(PVector pos, PVector v, int spdLim, float a, int hp, int resources, int resourceCap) {
    super(pos, v, spdLim, a);
    this.hp = hp;
    this.resources = resources;
    this.resourceCap = resourceCap;
  }

  void shoot() {
    if (resources >= 20){
    projectiles.add(new Bullet(pos.copy(), v.copy().normalize().mult(5), 30, 5));
    resources -= 20;
    }
    
  }

  void setHP(int health) {
    hp = health;
  }

  int getHP() {
    return hp;
  }

  int getResource() {
    return resources;
  }

  int getResourceCap() {
    return resourceCap;
  }

 
  void setResourceCap(int r) {
    resourceCap = r;
  }


  void move() {
    arrowHead();
    super.move();
    if (resources < resourceCap) {
      resources++;
    }
  }

  void boost(int f) {
    if (processes.getSize() == 0 && resources >= 50) {
      processes.add(new Burst(20, f));
      resources -= 50;
    }
  }

  void arrowHead() {
    PVector head = v.copy().normalize();
    PVector tail1 = head.copy().rotate(1.3 * HALF_PI);
    PVector tail2 = head.copy().rotate(-1.3 * HALF_PI);
    PVector a = PVector.add(pos, head.mult(h));
    PVector b = PVector.add(pos, tail1.mult(w));
    PVector c = PVector.add(pos, tail2.mult(w));
    triangle(a.x, a.y, pos.x, pos.y, c.x, c.y );
    triangle(a.x, a.y, pos.x, pos.y, b.x, b.y );
  }
}
