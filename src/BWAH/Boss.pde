class Boss {

 //Member Variables
  int x, y, diam, speed, rockhealth;
  PImage br1;

  //Constructor
  Boss() {
    x = int(random(width));
    y = -100;
    diam = 500;
    speed = 1;
    br1 = loadImage("rock1.png");
  }

  //Member Methods
  void display() {
    imageMode(CENTER);
    image(br1, x, y);
    br1.resize(diam,diam);
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
