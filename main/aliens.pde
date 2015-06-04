//comments
class aliens {

  PImage alien;
  int alienHP;
  int px, py;
  int[] points = new int[10];

  void loadAlien(int positiony) {
    alien = loadImage("alien.jpg");
    for (int i = 50; i < 500; i += 160) {
      image(alien, i, positiony);
    }
  }

  void loadRow(int positiony){
     for (int i = 50; i < 500; i+= 160){
        loadAlien(positiony);
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

