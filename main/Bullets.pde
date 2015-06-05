class Bullet {

  int xcor, ycor;
  int count;
  boolean fired;

  Bullet(int x) {
    xcor = x;
  }

  void shoot() {
    if (fired) {
      ellipse(xcor, ycor, 5, 10);
    }
  }

  int getX() {
    return ycor;
  }

  void setX(int n) {
    if (n >= 0 && n < 800) {
      xcor = n;
    }
  }

  int getY() {
    return Ycor;
  }

  void setY(int n) {
    if (n >= 0) {
      ycor = n;
    } else {
      fired = false;
    }
  }

