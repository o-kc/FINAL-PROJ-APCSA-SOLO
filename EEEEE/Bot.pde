public class Bot extends Sprite {
  private float ang;
  public Bot(PVector pos, PVector v, int spdLim, float a, int hp, int resources, int resourceCap) {
    super(pos, v, spdLim, a, hp, resources, resourceCap);
  }

  public void move(PVector target) {

    target(target);
    stroke(#FF0000);
    fill(#FF0000);
    super.move();
   
    super.shoot();
    
  }

  public void target(PVector p) {
    PVector ideal = PVector.sub(p, pos);

    float ang = v.heading() - ideal.heading();

    if (ang > PI) {       //v is over -180 counterclockwiser
      ang -= TWO_PI;      // --> clockwise (same ang since 2PI rotation) ; - ver
    } else if (ang < -PI) {  //v is over 180 clockwiser
      ang += TWO_PI;      // --> counterclockwise ; + ver
    }

    //-180 to 180 range relative to ideal, so Bot chooses quicker path

    if (ang > radians(20)) {  //if counterclockier
      v.rotate(radians(-5));
    } else if (ang < radians(-20)) { //if clockier
      v.rotate(radians(5));
    }
  }
}
