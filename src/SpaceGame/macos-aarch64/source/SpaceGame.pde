// Gabriel Farley | 18 Sept 2025 | SpaceGame
SpaceShip s1;
ArrayList<PowerUp> powups = new ArrayList<PowerUp>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
//ArrayList<LRock> lrocks = new ArrayList<LRock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer, puTimer;
int score, rocksPassed, turpow;
boolean play;
//setup and draw only exist inside tab1
void setup() {
  size(500, 500);
  background(22);
  s1 = new SpaceShip();
  puTimer = new Timer(5000);
  puTimer.start();
  rockTimer = new Timer (1000);
  rockTimer.start();
  score = 0;
  rocksPassed = 0;
  turpow = 25;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0, 0, 10);

    //distributes Power Ups on a timer
    if (puTimer.isFinished()) {
      powups.add(new PowerUp());
      puTimer.start();
    }

    //display PowerUps
    for (int i = 0; i < powups.size(); i++) {
      PowerUp pu = powups.get(i);
      pu.display();
      pu.move();
      // collision detection pu and ship
      if (pu.intersect(s1)) {
        powups.remove(pu);
        //based on type, benefit player
        if (pu.type == 'H') {
          s1.health = s1.health +2;
        } else if (pu.type == 'T') {
          s1.turretCount = s1.turretCount +1;
          turpow = 20;
          if (s1.turretCount>5) {
            s1.turretCount = 5;
          }
        } else if (pu.type == 'A') {
          s1.laserCount = s1.laserCount +20;
        }
      }
      if (pu.reachBottom()) {
        powups.remove(pu);
        i--;
      }
    }

    //removing turrets after 20 shots
    if (turpow<1) {
      s1.turretCount = s1.turretCount - 1;
      turpow = 20;
      if (s1.turretCount <1) {
        s1.turretCount = 1;
      }
    }

    // Adding Stars
    stars.add(new Star());

    //display Stars
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
        i--;
      }
    }

    //Distribute Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }

    //display Rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r1 = rocks.get(i);
      r1.display();
      r1.move();
      // collision detection rock and ship
      if (s1.intersect(r1)) {
        rocks.remove(r1);
        s1.health = s1.health - 1;
        s1.turretCount = 1;
      }
      if (r1.reachBottom()) {
        rocks.remove(r1);
        i--;
        rocksPassed++;
      }
    }
    ////Distribute LRocks
    //if (lrockTimer.isFinished()) {
    //  lrocks.add(new Rock());
    //  lrockTimer.start();
    //}

    ////display LRocks
    //for (int i = 0; i < lrocks.size(); i++) {
    //  LRock lr1 = lrocks.get(i);
    //  lr1.display();
    //  lr1.move();
    //  // collision detection rock and ship
    //  if (s1.intersect(lr1)) {
    //    rocks.remove(lr1);
    //    s1.health = s1.health - 1;
    //    s1.turretCount = 1;
    //  }
    //  if (lr1.reachBottom()) {
    //    rocks.remove(lr1);
    //    i--;
    //    rocksPassed++;
    //  }
    //}

    //Displays lasers / removes unwanted lasers
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j=0; j<rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          r.diam = r.diam -30;
          if (r.diam<5) {
            rocks.remove(r);
            score = score+1;
          }
          //remove laser :(
          lasers.remove(laser);
          // effect score
        }
        laser.display();
        laser.move();
        if (laser.reachedTop()) {
          lasers.remove(laser);
        }
        println(lasers.size());
      }
    }

    //println(rocks.size());

    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health<=0) {
      gameOver();
    }
  }
}
void mousePressed() {
  if (s1.fire()) {
    if (s1.turretCount==1) {
      lasers.add(new Laser(s1.x, s1.y-50));
      s1.laserCount--;
      turpow--;
    } else if (s1.turretCount==2) {
      lasers.add(new Laser(s1.x, s1.y-50));
      lasers.add(new Laser(s1.x+3, s1.y-50));
      s1.laserCount--;
      turpow--;
    } else if (s1.turretCount==3) {
      lasers.add(new Laser(s1.x, s1.y-50));
      lasers.add(new Laser(s1.x+3, s1.y-50));
      lasers.add(new Laser(s1.x - 3, s1.y-50));
      s1.laserCount--;
      turpow--;
    } else if (s1.turretCount==4) {
      lasers.add(new Laser(s1.x, s1.y-50));
      lasers.add(new Laser(s1.x+3, s1.y-50));
      lasers.add(new Laser(s1.x - 3, s1.y-50));
      lasers.add(new Laser(s1.x - 6, s1.y-50));
      s1.laserCount--;
      turpow--;
    } else if (s1.turretCount==5) {
      lasers.add(new Laser(s1.x, s1.y-50));
      lasers.add(new Laser(s1.x+3, s1.y-50));
      lasers.add(new Laser(s1.x - 3, s1.y-50));
      lasers.add(new Laser(s1.x - 6, s1.y-50));
      lasers.add(new Laser(s1.x + 6, s1.y-50));
      s1.laserCount--;
      turpow--;
    }
  }
}

void infoPanel() {
  rectMode(CENTER);
  fill(100, 100);
  rect(width/2, height-25, width, 50);
  fill(225);
  textSize(25);
  text("Score:" +score, 20, 40);
  text("ROCKS PASSED:" + rocksPassed, width-300, 40);
  text("Health:" +s1.health, 350, height-20);
  text("Ammo:" +s1.laserCount, 100, height-20);
  text("Turrets:" +s1.turretCount, 220, height-20);
  //fill(255, 0, 0);
  //rect(50,height-100,s1.health,10);
  //The Two lines above set up a health bar!
}
void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Click your mouse to start!", width/2, height/2);
  if (mousePressed) {
    play = true;
  }
}
void gameOver() {
  fill(0, 0, 0);
  rect(0, 0, 5000, 5000);
  fill(255);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
  text("You got a score of: " + score, width/2, 150);
  noLoop();
}
