class LRock {
  //Member Variables
  int x, y, diam, speed, rockhealth;
  PImage lr1;

  //Constructor
  LRock() {
    x = int(random(width));
    y = -100;
    diam = int(random(90, 130));
    speed = int(random(1, 2));
    lr1 = loadImage("rock1.png");
  }

  //Member Methods
  void display() {
    imageMode(CENTER);
    image(lr1, x, y);
    lr1.resize(diam,diam);
  }

  void move() {
    y = y + speed;
  }

  void fire() {
  }

  boolean reachBottom() {
    if(y>height+diam+4) {
      return true;
    } else {
      return false;
    }
  }
}
