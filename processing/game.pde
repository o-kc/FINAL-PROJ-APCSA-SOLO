ArrayList<PVector> blu = new ArrayList<PVector>();
int bluSize = 1;
ArrayList<PVector> red = new ArrayList<PVector>();
int redSize = 1;
void setup(){ 
  size(300, 300);

  blu.add(new PVector((int) (Math.random() * width), (int) (Math.random() * height)));
 
}

void tick(){
  ArrayList<PVector> newB = new ArrayList<PVector>();
  loadPixels();
  for (PVector i : blu){

  if(i.y-1 > 0 && 255 != blue(pixels[((int) i.y - 1) * width + (int) i.x])){
    pixels[((int) i.y - 1) * width + (int) i.x] = #0000FF;
    newB.add(new PVector(i.x, i.y-1));
  }
  if(i.y+1 < height && 255 != blue(pixels[((int) i.y + 1) * width + (int) i.x])){
    pixels[((int) i.y + 1) * width + (int) i.x] = #0000FF;
    newB.add(new PVector(i.x, i.y+1));
  }
  if(i.x-1 > 0 && 255 != blue(pixels[((int) i.y) * width + (int) i.x - 1])){
    pixels[((int) i.y) * width + (int) i.x-1] = #0000FF;
    newB.add(new PVector(i.x-1, i.y));

  }
  if(i.x+1 < width && 255 != blue(pixels[((int) i.y) * width + (int) i.x + 1])){
    pixels[((int) i.y) * width + (int) i.x+1] = #0000FF;
    newB.add(new PVector(i.x+1, i.y));
  }
}
updatePixels();
blu = newB;
}

void draw(){
  tick();
  
  
}
