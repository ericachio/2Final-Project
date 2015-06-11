class Bullet {

  int xcor, ycor;
  int count;
  boolean fired;
  boolean player;
  boolean hit;

  Bullet(int x, int y, int c, boolean p) {
    if (p) {
      ycor = 545;
    } else {
      ycor = y;
    }
    xcor = x;
    count = c;
    xcor = x;
    player = p;
    fired = true;
    hit = false;
  }

  Bullet(int x) {
    this(x, 545, 1, true);
  }

  void shoot() {
    if (fired && hit == false) {
      ellipse(xcor, ycor, 5, 10);
    } else if (hit && fired){
      setX(xcor);
      setY(ycor);
      println("X" + getX());
      println("Y" + getY());
    }
  }

  void setH(boolean h) {
    hit = h;
  }  

  int getX() {
    return xcor;
  }

  void setX(int n) {
    if (n >= 0 && n < 800) {
      xcor = n;
    }
  }

  int getY() {
    return ycor;
  }

  void setY(int n) {
    if (player && ycor - n >= 0) {
      ycor -= n;
    } else if (!player && ycor + n <= 600) {
      ycor += n;
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
    count = n;
    if (n<=0) {
      fired = false;
    }
  }
}

