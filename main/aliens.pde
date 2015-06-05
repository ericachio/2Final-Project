//comments
class aliens {

  PImage alien;
  int alienHP;
  int px, py;
  boolean playerAlive;

  void loadAlien(int positionx, int positiony) {
    px = positionx;
    py = positiony;
    alien = loadImage("alien.jpg");
    image(alien, positionx, positiony, 80, 80);
  }

  void loadRow(int positionx, int positiony) {
    for (int i = 50; i < 500; i+= 160) {
      loadAlien(positionx, positiony);
    }
  }

  void setPosition(int position) {
    px = position;
  }

  void loadAa() {
  }

  int getPX() {
    return px;
  }

  int getPY() {
    return py;
  }

  //will be a recursive to move alien across the screen
  void move(int positionx, int positiony) {
    if (positiony == 100) {
      if (positionx < 600) {
        image(alien, positionx, positiony, 80, 80);
        positionx += 1;
        px = positionx;
        py = positiony;
        playerAlive = true;
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
}
