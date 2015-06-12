class aliens {

  PImage alien = loadImage("alien.jpg");

  int alienHP;
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
    if (alive == true) {
      image(alien, px, py, 40, 30);
    } else if (alive == false){
      setPosition(0);
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

<<<<<<< HEAD
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

  boolean isShot() {
    return alive;
  }

  void setS(boolean b) {
    alive = b;
  }
}

=======
}







>>>>>>> 6ee885b507c293e41f153add88e81ae15f954f06
