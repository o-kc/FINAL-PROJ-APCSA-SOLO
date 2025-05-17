public class Cell {
  ArrayList<PVector> border = new ArrayList<PVector>();
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
    border = expand(border);
    }
  }
  public ArrayList<PVector> expand(ArrayList<PVector> bounds) {
    ArrayList<PVector> newB = new ArrayList<PVector>();
    for (PVector i : bounds) {
      if (i.y - 1 >= 0 && colorCode != p[((int) i.y - 1) * w + (int) i.x]) {
        p[((int) i.y - 1) * w + (int) i.x] = colorCode;
        newB.add(new PVector(i.x, i.y - 1));
      }
      if (i.y + 1 < h && colorCode != p[((int) i.y + 1) * w + (int) i.x]) {
        p[((int) i.y + 1) * w + (int) i.x] = colorCode;
        newB.add(new PVector(i.x, i.y + 1));
      }
      if (i.x - 1 >= 0 && colorCode != p[((int) i.y) * w + (int) i.x - 1]) {
        p[((int) i.y) * w + (int) i.x - 1] = colorCode;
        newB.add(new PVector(i.x - 1, i.y));
      }
      if (i.x + 1 < w && colorCode!= p[((int) i.y) * w + (int) i.x + 1]) {
        p[((int) i.y) * w + (int) i.x + 1] = colorCode;
        newB.add(new PVector(i.x + 1, i.y));
      }
    }
    extent += newB.size();
    return newB;
  }
}
