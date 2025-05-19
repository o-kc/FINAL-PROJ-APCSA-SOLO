import java.util.*;
public class Cell {
  LinkedList<PVector> border = new LinkedList<PVector>();
  color colorCode;
  int extent = 1;
  int energy;
  public Cell(int e, color c, PVector pos) {
    border.add(pos);
    colorCode = c;
    energy = e;
  }
  
  public void spread(){
    if (border.size() != 0){
    border = expand();
    }
  }
  
  public LinkedList expand() {
    LinkedList<PVector> newB = new LinkedList<PVector>();
            
    Iterator<PVector> iterator = border.iterator();
    while (iterator.hasNext()) {
      PVector i = iterator.next();
      if (i.y - 1 >= 0 && #FFFFFF == p[((int) i.y - 1) * w + (int) i.x]) {
        p[((int) i.y - 1) * w + (int) i.x] = colorCode;
        newB.add(new PVector(i.x, i.y - 1));
      }
      if (i.y + 1 < h && #FFFFFF == p[((int) i.y + 1) * w + (int) i.x]) {
        p[((int) i.y + 1) * w + (int) i.x] = colorCode;
        newB.add(new PVector(i.x, i.y + 1));
      }
      if (i.x - 1 >= 0 && #FFFFFF == p[((int) i.y) * w + (int) i.x - 1]) {
        p[((int) i.y) * w + (int) i.x - 1] = colorCode;
        newB.add(new PVector(i.x - 1, i.y));
      }
      if (i.x + 1 < w && #FFFFFF == p[((int) i.y) * w + (int) i.x + 1]) {
        p[((int) i.y) * w + (int) i.x + 1] = colorCode;
        newB.add(new PVector(i.x + 1, i.y));
      }
    }
    extent += newB.size();
    return newB;
  }
  
  
  public void invade(LinkedList bounds, color ENEMY) {
    LinkedList<PVector> newB = new LinkedList<PVector>();
            
    Iterator<PVector> iterator = bounds.iterator();
    while (iterator.hasNext()) {
      PVector i = iterator.next();
      if (i.y - 1 >= 0 && ENEMY == p[((int) i.y - 1) * w + (int) i.x]) {
        p[((int) i.y - 1) * w + (int) i.x] = colorCode;
        border.add(new PVector(i.x, i.y - 1));
      }
      if (i.y + 1 < h && ENEMY == p[((int) i.y + 1) * w + (int) i.x]) {
        p[((int) i.y + 1) * w + (int) i.x] = colorCode;
        border.add(new PVector(i.x, i.y - 1));
      }
      if (i.x - 1 >= 0 && ENEMY == p[((int) i.y) * w + (int) i.x - 1]) {
        p[((int) i.y) * w + (int) i.x - 1] = colorCode;
        border.add(new PVector(i.x, i.y - 1));
      }
      if (i.x + 1 < w && ENEMY == p[((int) i.y) * w + (int) i.x + 1]) {
        p[((int) i.y) * w + (int) i.x + 1] = colorCode;
        border.add(new PVector(i.x, i.y - 1));
      }
      border.remove(i);
    }
  }
}
