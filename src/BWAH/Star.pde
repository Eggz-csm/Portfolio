class Star {
  //member variables
  int x, y, w, speed;
  boolean c;
  Star() {
    x = int(random (width));
    y = -10;
    w = int(random(2, 10));
    speed = int(random(2, 8));
    c = true;
  }
  void display() {
    if(c=true){
      fill(random(90, 200), random(100, 150), random(200, 255));
      c=false;
    }
    ellipse(x, y, w, w);
  }
  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y>height+10) {
      return true;
    } else {
      return false;
    }
  }
}
