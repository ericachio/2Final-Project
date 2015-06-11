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

}







