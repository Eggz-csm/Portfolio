class Rock {
  //Member Variables
  int x, y, diam, speed;
  PImage r1;

  //Constructor
  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(50, 90));
    speed = int(random(3, 6));
    if (random(10)>6.6) {
      r1 = loadImage("rock1.png");
    } else if (random(10)>3.3) {
      r1 = loadImage("rock2.png");
    } else {
      r1 = loadImage("rock3.png");
    }
  }

  //Member Methods
  void display() {
    imageMode(CENTER);
    image(r1, x, y);
    r1.resize(diam,diam);
    
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
