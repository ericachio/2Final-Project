class UFO {

  int xcor, ycor;
  boolean direction;
  boolean alive;

  PImage ship = loadImage("ufo.png");


  UFO(boolean d) {
    direction = d;
    if (d) {
      xcor = 0;
    } else {
      xcor = 800;
    }
    ycor = 70;
    alive = true;
  }

  UFO() {
    alive = false;
  }

  void load() {
    if (alive == true) {
      image(ship, xcor, ycor, 40, 30);
    }
  }

  void move() {
    if (alive) {
      if (direction) {
        xcor+=2;
      } else {
        xcor-=2;
      }
    }
    if (xcor< 0 || xcor > 800) {
      alive = false;
    }
  }

  boolean status() {
    return alive;
  }

  void setS(boolean s) {
    alive = s;
  }

  void die() {
    alive = false;
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
}

