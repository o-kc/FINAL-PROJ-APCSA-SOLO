public class Shield extends Emitter{
  public Shield(int d, PVector p, int r, float i, color c){
    super(d, p, r, i, c);
  }

  public void run(){
     super.run();
     duration = one.getHP() - one.getResourceCap() * 5;
  }

}
