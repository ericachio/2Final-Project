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
  
  Bullet(int x, int y){
    xcor = x;
    ycor = y;
    player = true;
    fired = true;
    hit = false;
  }

  void shoot() {
    if (fired && !hit) {
      ellipse(xcor, ycor, 5, 10);
    } else {
      xcor = 0;
      ycor = 0;
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
    }
    if (ycor <= 20 || ycor >= 590) {
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

