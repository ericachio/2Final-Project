//comments
class aliens {

  PImage alien;
  int alienHP;
  int px, py;
  int[] points = new int[10];

  void loadAlien(int positionx, int positiony, int index) {
    alien = loadImage("alien.jpg");
    image(alien, positionx, positiony);
    println("px" + positionx);
    println("py" + positiony);
    alienHP = 10;
  }

  void loadRow(int positionx, int positiony) {
    int index = 0;
    for (int i = positionx; i < 700; i = i + 160) {
      println("positionx" + i);
      println("positiony" + positiony);
      points[index] = i;
      points[index++] = positiony;
      loadAlien(i, positiony, index);
      index += 2;
    }
  }

  void printRow() {
    for (int i = 0; i < 8; i += 2) {
      //println(points[i], points[i++]);
      println("indexx" + points[i]);
      println("indexy" + points[i++]);
      image(alien, points[i], points[i++]);
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

