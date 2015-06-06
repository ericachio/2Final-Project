//comments
class aliens {

  PImage alien = loadImage("alien.jpg");

  int alienHP;
  int px, py;
  int level;
  boolean playerAlive;
  
  aliens(int x, int y, int l){
    px =x;
    py =y;
    level = l;
  }

  void loadAlien() {
    image(alien, px, py, 40, 30);
  }

//  void loadRow(int positionx, int positiony) {
//    for (int i = 50; i < 500; i+= 160) {
//      loadAlien(positionx, positiony);
//    }
//  }

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
