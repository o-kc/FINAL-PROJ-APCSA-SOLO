ArrayList<Bot> ships;
Bullets projectiles = new Bullets();
Animations animate;
Events processes;
Player one;

int[] stats;
Inputs interfaces;


int ticks = 0;
boolean UI = false;

PVector BOTPosition;
PVector BOTInitialVelocity = new PVector(0, -1);
int BOTSpeedLimit;
float BOTAcceleration = 2;

int BOTHealth = 100;
int BOTInitialResource = 50;
int BOTResourceCap = 200;


void setup() {
  stats = new int[10];
  interfaces = new Inputs();
  interfaces.add(new Input(20, 30, 50, 60, #FFFFFF, "speedPlayer"));
  interfaces.add(new Input(70, 90, 50, 60, #FFFFFF, "slowPlayer"));
  interfaces.add(new Input(120, 150, 50, 60, #FFF00F, "incResource"));
  interfaces.add(new Input(170, 210, 50, 60, #FFF00F, "decResource"));
  interfaces.add(new Input(220, 270, 50, 60, #F0F0FF, "incSHIELD"));
  interfaces.add(new Input(270, 330, 50, 60, #F0F0FF, "decSHIELD"));
  interfaces.add(new Input(320, 390, 50, 60, #F00F00, "incBoost"));
  interfaces.add(new Input(370, 450, 50, 60, #F00F00, "decBoost"));
  interfaces.add(new Input(420, 510, 50, 60, #00FFF0, "incManeuver"));
  interfaces.add(new Input(470, 570, 50, 60, #00FFF0, "decManeuver"));
  size(800, 800);
  ships = new ArrayList<Bot>();
  animate = new Animations();
  processes = new Events();

  PVector playerPosition = new PVector(width/2, height/2);
  PVector initialVelocity = new PVector(0, -1);
  int speedLimit = 5;
  float acceleration = 2;

  int health = 800;
  int initialResource = 50;
  int resourceCap = 100;

  one = new Player(playerPosition, initialVelocity, speedLimit, acceleration, health, initialResource, resourceCap);
  stats[0] = one.getMaxSpeed();
  stats[1] = one.getResourceCap();
  stats[2] = one.getHP();
  stats[3] = one.getBoostSetting();
  stats[4] = one.getManeuver();
  
  Animation e = new Shield(2000, one.getPos(), 50, 0.05, #00FF00);

  animate.add(e);  //duration, pos, size, x-increment
}

void draw() {
 
  if (UI) {
    background(0);
    drawUI();
  } else {
    background(100);

    move();

    if (one.getHP() <= 0) {
      delay(500);
      setup();
    }

    drawBars();
  }
}


void move() {
  animate.run();
  processes.run();

  one.move();

  for (Bot b : ships) {
    b.move(one.getPos());
  }

  projectiles.move();
}

void drawBars() {
  fill(100);
  rect(0, 0, one.getResourceCap()*5, 20);
  fill(#FF0000);
  rect(0, 0, one.getHP(), 10);
  fill(#FFFF00);
  rect(0, 10, one.getResource()*5, 10);
  ticks++;
}

void drawUI() {
  interfaces.draw();
}

void keyPressed() {
  if (key == '1') {
    summonBot();
  } else {
    one.turn(key);
  }
}

void keyReleased() {
  if (key == ' ') {
    setup();
  } else if (key == 'q') {
    UI = !UI;
  }
}

void summonBot() {
  BOTSpeedLimit = (int) random(5) + 5;
  BOTPosition = new PVector(random(width), random(height));
  animate.add(new Ripple(200, BOTPosition.copy(), 50, 0.05, #FF0000));
  ships.add(new Bot(BOTPosition.copy(), BOTInitialVelocity.copy(), BOTSpeedLimit, BOTAcceleration, BOTHealth, BOTInitialResource, BOTResourceCap));
}

void mousePressed() {
  if (UI) {
    switch(interfaces.check(mouseX, mouseY)) {
    case "speedPlayer":
      one.setMaxSpeed(one.getMaxSpeed() + 1);
      stats[0] = one.getMaxSpeed();
      break;
    case "slowPlayer":
      one.setMaxSpeed(one.getMaxSpeed() - 1);
      stats[0] = one.getMaxSpeed();
      break;
    case "incResource":
      one.setResourceCap(one.getResourceCap() + 100);
      stats[1] = one.getResourceCap();
      break;
    case "decResource":
      one.setResourceCap(one.getResourceCap() - 100);
      stats[1] = one.getResourceCap();
      break;
    case "incSHIELD":
      one.setHP(one.getHP() + 100);
      stats[2] = one.getHP();
      break;
    case "decSHIELD":
      one.setHP(one.getHP() - 100);
      stats[2] = one.getHP();
      break;
    case "pressed invalid region!!!":
      for (int i = 0; i < 10; i++) {
        summonBot();
      }
    case "incBoost":
      one.setBoostSetting(one.getBoostSetting() + 1);
      stats[3] = one.getBoostSetting();
      break;
    case "decBoost":
      one.setBoostSetting(one.getBoostSetting() - 1);
      stats[3] = one.getBoostSetting();
      break;
    case "incManeuver":
      one.setManeuver(one.getManeuver() + 1);
      stats[4] = one.getManeuver();
      break;
    case "decManeuver":
      one.setManeuver(one.getManeuver() - 1);
      stats[4] = one.getManeuver();
      break;
    }
  }
}
