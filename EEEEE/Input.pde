public class Input {
  private int x;
  private int y;
  private int w;
  private int h;
  private color hue;
  private String methodCode;
  public Input (int xv, int yv, int w, int h, color c, String method) {
    x = xv;
    y = yv;
    this.w = w;
    this.h = h;
    hue = c;
    methodCode = method;
  }

  public boolean bound(int xv, int yv) {
    boolean xx = xv > x && xv < x + w;
    boolean yy =  yv > y && yv < y + h;
    return xx && yy;
  }

  public String getMethodCode() {
    return methodCode;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public int getWidth() {
    return w;
  }

  public int getHeight() {
    return h;
  }

  public color getHue() {
    return hue;
  }
}
