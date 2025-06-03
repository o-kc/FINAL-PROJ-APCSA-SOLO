public class Events {
  private ArrayList<Event> procession = new ArrayList<Event>();

  public Events() {
  }

  public void add(Event e) {
    procession.add(e);
  }

  public Event get(int i) {
    return procession.get(i);
  }
  public void run() {
    for (int i = 0; i < procession.size(); i++) {
      Event e = procession.get(i);
      if (e.getD() <= 0) {
        e.run();
        procession.remove(i);
        i--;
      } else {
        e.decay();
      }
    }
  }

  public int getSize() {
    return procession.size();
  }
}
