public class Moveable {
  protected PVector pos;
  protected PVector v;
  protected int speedLimit;
  protected float a;
  public Moveable(PVector source, PVector vel, int spdLim, float acceleration) {
    pos = source;
    speedLimit = spdLim;
    a = acceleration;
    v = vel;
  }

  public void move() {
    if (pos.x >= 0 && pos.x < width && pos.y >= 0 && pos.y < height) {
      pos.add(v);
    } else {
      pos.set(width/2, height/2);
    }

    v.mult(a);
    v.limit(speedLimit);
    a = 1.1;
  }

  public PVector getPos() {
    return pos;
  }

  public void applyForce(PVector a) {
    v.add(a);
  }
  
  public int getMaxSpeed(){
    return speedLimit;
  }
  
  public void setMaxSpeed(int s){
    speedLimit = s;
  }
}
