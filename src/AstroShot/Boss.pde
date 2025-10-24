class Boss {

 //Member Variables
  int x, y, diam, speed, hel;
  PImage b1;

  //Constructor
  Boss() {
    x = width/2;
    y = -300;
    diam = 500;
    speed = 1;
    b1 = loadImage("rock1.png");
    hel = 15;
  }

  //Member Methods
  void display() {
    imageMode(CENTER);
    image(b1, x, y);
    b1.resize(diam,diam);
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
