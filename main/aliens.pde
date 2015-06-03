class aliens {

  PImage alien;
  int alienHP;
  int px, py;

  void loadAlien(int positionx, int positiony) {
    px = positionx;
    py = positiony;
    alien = loadImage("alien.jpg");
    alienHP = 10;
    image(alien, positionx, positiony);
  }

  int getPX() {
    return px;
  }

  int getPY() {
    return py;
  }

  //will be a recursive to move alien across the screen
  void move(int positionx, int positiony) {
    if (positionx < 600) {
      image(alien, positionx, positiony);
      positionx += 1;
      px = positionx;
    } else {
      image(alien, positionx, positiony);
    }
  }
}

