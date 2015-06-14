class aliens {

  PImage alien1 = loadImage("alien1.png");
  PImage alien2 = loadImage("alien2.png");
  PImage alien3 = loadImage("alien3.png");
  PImage[] alien;
  int step;
  int x;

  int HP;
  int px, py;
  int level;
  int count;
  int steps;
  int speed;
  boolean direction;
  boolean alive;
  boolean playerAlive;

  aliens(int x, int y, int l) {
    px =x;
    py =y;
    level = l;
    count = 8;
    steps = 90;
    speed = 1;
    direction = true;
    alive = true;
  }

  void loadAlien() {
    x = 0;
    alien = new PImage[2];
    if (alive) {
      if (level == 1) {
        for (int n = 0; n < 2; n++) {
          alien[n] = alien1.get(x, 0, 115, 80);
          x+=115;
        }
      } else if (level == 2) {
        for (int n = 0; n < 2; n++) {
          alien[n] = alien2.get(x, 0, 105, 80);
          x+=105;
        }
      } else if (level == 3) {
        for (int n = 0; n < 2; n++) {
          alien[n] = alien3.get(x, 0, 90, 80);
          x+=90;
        }
      }
    } else {
      px = 0;
    }
  }

  void action() {
    step = 0;
    image(alien[step], px, py, 40, 30);
    step++;
    if (step >= alien.length -1) {
      step = 0;
    }
  }

  //  void loadRow(int positionx, int positiony) {
  //    for (int i = 50; i < 500; i+= 160) {
  //      loadAlien(positionx, positiony);
  //    }
  //  }

  void setPosition(int position) {
    px = position;
  }

  int getPX() {
    return px;
  }

  int getPY() {
    return py;
  }

  void moveAlien() {  
    if (direction) {
      px+=speed;
    } else {
      px-=speed;
    }
    steps--;
    if (steps == 0) {
      direction = !direction;
      count--;
      steps = 160;
    }
    if (count == 0) {
      py+=80;
      count = 10;
    }
  }  

  /*
  //will be a recursive to move alien across the screen
   void move(int positionx, int positiony) {
   if (positiony == 100) {
   if (positionx < 600) {
   image(alien, positionx, positiony, 80, 80);
   positionx += 1;
   px = positionx;
   py = positiony;
   playerAlive = true;
   } //else {
   //image(alien, positionx, positiony, 80, 80);
   //move(positionx, positiony);
   else if (positionx > 100) {
   image(alien, positionx, positiony, 80, 80);
   positionx -= 1;
   px = positionx;
   py = positiony;
   } else {
   image(alien, positionx, positiony, 80, 80);
   move(positionx, positiony + 160);
   }
   } else if (positiony == 260) {
   if (positionx > 100) {
   image(alien, positionx, positiony, 80, 80);
   positionx -= 1;
   px = positionx;
   py = positiony;
   } else {
   image(alien, positionx, positiony, 80, 80);
   move(positionx, positiony + 160);
   }
   } else if (positiony == 420) { 
   if (positionx < 600) {
   image(alien, positionx, positiony, 80, 80);
   positionx += 1;
   px = positionx;
   py = positiony;
   playerAlive = false;
   }
   }
   }
   */

  boolean isShot() {
    return alive;
  }

  void setS(boolean b) {
    alive = b;
  }
}

