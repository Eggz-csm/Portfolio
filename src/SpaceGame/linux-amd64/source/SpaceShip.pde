class SpaceShip {
  //Member Variables
  //health, speed, ammo, lives;  boolean shield;  color c;
  int x, y, w, health, laserCount, turretCount;
  //PImage ship;

  //Constructor
  SpaceShip() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 3;
    laserCount =50;
    turretCount = 1;
    //ship = loadImage("");
  }

  //Member Methods
  void display() {
    //imageMode(CENTER);
    //image(ship,x,y);
    fill(70, 60, 120);
    stroke(300);
    strokeWeight(4);
    line(x-25, y+30, x-25, y-30);
    rectMode(CENTER);
    rect(x, y+15, 45, 10);
    triangle(x, y-50, x-10, y+20, x+10, y+20);
    rect(x+20, y, 5, 30);
    rect(x-20, y, 5, 30);
    triangle(x-20, y+50, x-22, y+20, x-16, y+20);
    triangle(x+20, y+50, x+22, y+20, x+16, y+20);
    triangle(x, y+40, x-10, y+20, x+10, y+20);
    fill(200, 120, 250);
    triangle(x, y-10, x, y+8, x+6, y+10);
    triangle(x, y-10, x, y+8, x-6, y+10);
    fill(250, 40, 150);
    triangle(x-23, y-15, x-17, y-15, x-20, y-30);
    triangle(x+23, y-15, x+17, y-15, x+20, y-30);
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  boolean fire() {
    if (laserCount>0) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(LRock lr1) {
    float d = dist(s1.x, s1.y, lr1.x, lr1.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r1) {
    float d = dist(s1.x, s1.y, r1.x, r1.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }
}
