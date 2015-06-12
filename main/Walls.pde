class Walls {

  int hp;
  int xcor, ycor;
  boolean alive;
  int ysize;

  Walls(int x, int y) {
    hp = 10;
    alive = true;
    xcor = x;
    ycor = y;
    ysize = 20;
  }

  int getHP() {
    return hp;
  }

  void decHP() {
    hp-=1;
    ysize -= 2;
    if (hp == 0 || ysize <= 0) {
      alive = false;
      xcor = 0;
      ycor = 0;
    } else {
      rect(xcor, ycor, 80, ysize);
    }
  }

  boolean status() {
    return alive;
  }

  int getX() {
    return xcor;
  }

  void setX(int n) {
    xcor = n;
  }

  int getY() {
    return ycor;
  }

  void setY(int n) {
    ycor = n;
  }

  void loadWall() {
    if (alive) {
      rect(xcor, ycor, 80, ysize);
      fill(80);
    }
  }
}

