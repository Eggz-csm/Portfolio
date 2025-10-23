class Laser {
  //Member Variables
  //health, speed, ammo, lives;  boolean shield;  color c;
  int x, y, w, h, speed;
  PImage Laser;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 5;
    Laser = loadImage("Laser.png");
  }

  //Member Methods
  void move() {
    y = y-speed;
  }
  void display() {
    imageMode(CENTER);
    image(Laser, x, y);
  }
  void fire() {
  }

  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(LRock lr1) {
    float d = dist(x, y, lr1.x, lr1.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
