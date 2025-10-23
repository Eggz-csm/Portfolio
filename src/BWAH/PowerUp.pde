class PowerUp {
  //Member Variables
  int x, y, diam, speed;
  char type;
  color c1;
  float c;
  //PImage r1;

  //Constructor
  PowerUp() {
    x = int(random(width));
    y = -100;
    diam = 100;
    speed = 4;
    c=random(10);
    if (c>8.6) {
      // r1 = loadImage("rock1.png");
      type = 'H';
      c1 = color(150, 240, 200);
    } else if (c>5.3) {
      //r1 = loadImage("rock2.png");
      type = 'T';
      c1 = color(233, 150, 180);
    } else {
      //r/1 = loadImage("rock3.png");
      type = 'A';
      c1 = color(20, 50, 180);
    }
  }

  //Member Methods
  void display() {
    fill(c1);
    ellipse(x, y, diam, diam);
    fill(20, 20, 200);
    textSize(20);
    textAlign(CENTER);
    text(type, x, y);
  }

  void move() {
    y = y + speed;
  }

  void fire() {
  }

  boolean intersect(SpaceShip r) {
    float d = dist(x, y, r.x, r.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachBottom() {
    if (y>height+diam+4) {
      return true;
    } else {
      return false;
    }
  }
}
