class aliens {

  PImage alien;
  int alienHP;

  void loadAlien() {
    alien = loadImage("alien.jpg");
    alienHP = 10;
  }

  //will be a recursive to move alien across the screen
  void move() {
    int positionx = 100;
    int positiony = 100;
    for (int i = 0; i < 600; i = i + 160) {
      for (int j = 0; j < 500; j = j + 160) {
        image(alien, positionx, positiony);
      }
    }
  }
}

