class Bullet {

  int xcor, ycor;
  int count;
  boolean fired;

  Bullet(int x, int c) {
<<<<<<< HEAD
    ycor = 545;
    xcor = x;
    count = c;
=======
    xcor = x;
>>>>>>> player
    fired = true;
  }
  
  Bullet(int x){
    this(x,1);
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
<<<<<<< HEAD
    return ycor;
=======
    return Ycor;
>>>>>>> player
  }

  void setY(int n) {
    if (n >= 0) {
      ycor = n;
    } else {
      fired = false;
    }
  }

  void setXY(int x, int y) {
    if (x >= 0 && x < 800) {
      xcor = x;
    }
    if (y >= 0) {
      ycor = y;
    } else {
      fired = false;
    }
  }

  boolean isFired() {
    return fired;
  }

  void setStatus(boolean b) {
    fired = b;
  }

  int getCount() {
    return count;
  }

  void setCount(int n) {
<<<<<<< HEAD
    count = n;
=======
    count = n
>>>>>>> player
      if (n<=0) {
      fired = false;
    }
  }

}
