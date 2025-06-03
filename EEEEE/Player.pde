public class Player extends Sprite {

  float disturbance;
  int maneuver = 5;
  int boostSetting = 2;
  public Player(PVector pos, PVector v, int spdLim, float a, int hp, int resources, int resourceCap) {
    super(pos, v, spdLim, a, hp, resources, resourceCap);
  }

  public void turn(char key) {
    if (maneuver > 2) {
      if (key == 'd') {
        v.rotate(radians(15));

        disturbance = 0.01;
      } else if (key == 'a') {
        v.rotate(radians(-15));

        disturbance = -0.01;
      }
      a *= 0.99;
      maneuver = 0;
    }
    if (key == 'w') {
      boost(boostSetting);
    }
    if (key == 's') {
      if (resources >= 10) {
        v.rotate(PI);
        v.normalize();
        resources -= 10;
      }
    }
    if (key == 'f') {
      shoot();
    }
  }

  @Override
    public void shoot() {
    if (resources >= 20) {
      projectiles.add(new Friendly(pos.copy(), v.copy().normalize().mult(5), 30, 5));
      resources -= 20;
    }
  }

  public void hit() {
    
      textSize(32);
      text("stop u die!!!", pos.x - 80, pos.y);
   
      hp -= 5;
    
  }


  public void setBoostSetting(int b) {
    boostSetting = b;
  }

  public int getBoostSetting() {
    return boostSetting;
  }

  public void setManeuver(int m) {
    maneuver = m;
  }

  public int getManeuver() {
    return maneuver;
  }

  public void move() {
      stroke(#00FF00);
      fill(#00FF00);
    super.move();
    v.rotate(disturbance);
    maneuver++;
  }
}
