class Player {

  PImage ship;

  int health;
  int points;
  int coins;
  int lives;
  int level;
  int xcor, ycor;
  int BXcor, BYcor;
  boolean fired;


  Player() {
    health = 200;
    points = 0;
    coins = 0;
    lives = 3;
    level = 1;
    xcor = 380;
    ycor = 550;
  }

  void loadPlayer() {
    ship = loadImage("ship.png");
    image(ship, xcor, ycor, 50, 40);
  }

  void shoot() {
    if (fired) {
      ellipse(BXcor, BYcor, 5, 10);
    }
  }

  boolean getStatus() {
    return fired;
  }

  void setStatus(boolean f) {
    fired = f;
  }

  int getBX() {
    return BXcor;
  }

  void setBX(int n) {
    if (n >= 0 && n < 800) {
      BXcor = n;
    }
  }

  int getBY() {
    return BYcor;
  }

  void setBY(int n) {
    if (n >= 0) {
      BYcor = n;
    } else {
      fired = false;
    }
  }


  int getHealth() {
    return health;
  }

  void setHealth(int n) {
    health = n;
  }

  int getPoints() {
    return points;
  }

  void setPoints(int n) {
    points = n;
  }

  int getCoins() {
    return coins;
  }

  void setCoins(int n) {
    coins = n;
  }

  int getLives() {
    return lives;
  }

  void setLives(int n) {
    lives = n;
  }

  int getLevel() {
    return level;
  }

  void setLevel(int n) {
    level = n;
  }

  int getX() {
    return xcor;
  }

  void setX(int n) {
    if (n > 0 && n < 750) {
      xcor = n;
    }
  }

  int getY() {
    return ycor;
  }

  void setY(int n) {
    if (n>=0 && n < 400) {
      ycor = n;
    }
  }
}