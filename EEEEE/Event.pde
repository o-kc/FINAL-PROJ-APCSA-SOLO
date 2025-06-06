public abstract class Event {
  protected int duration;

  public Event(int d) {
    duration = d;
    
  }

  public abstract void run();

  public int getD() {
    return duration;
  }
  
 public void setD(int d) {
    duration = d;
  }

  public void decay() {
    duration--;
  }
}
