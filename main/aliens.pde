//comments
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
  
  void loadRow(int positionx, int positiony){
    for (int i = positionx; i < 700; i += 160){
       loadAlien(i, positiony); 
    }
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
        image(alien, positionx, positiony);
        positionx += 1;
        px = positionx;
        py = positiony;
      } else {
        image(alien, positionx, positiony + 160);
        move(positionx, positiony + 160);
      }
    } else if (positiony == 260) {
      if (positionx > 100) {
        image(alien, positionx, positiony);
        positionx -= 1;
        px = positionx;
        py = positiony;
      } else {
        image(alien, positionx, positiony + 160);
        //move(positionx, positiony + 160);
      }
    }
  }
}

