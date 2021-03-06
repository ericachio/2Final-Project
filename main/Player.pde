class Player {

  PImage ship = loadImage("ship.png");

  int health;
  int points;
  int coins;
  int lives;
  int level;
  int xcor, ycor;
  boolean alive;

  Player() {
    health = 300;
    points = 0;
    coins = 0;
    lives = 3;
    level = 1;
    xcor = 380;
    ycor = 550;
    alive = true;
  }

  void mode() {
    if (points < 150) {
      level = 1;
    } else if (points >= 150 && points < 400) {
      level = 2;
    } else if (points >= 400 && points < 800) {
      level = 3;
    } else if (points >= 800) {
      level = 4;
    }
  }

  void loadPlayer() {
    image(ship, xcor, ycor, 50, 40);
  }


  int getHealth() {
    return health;
  }


  void decLives() {
    lives--;
    if (lives == 0) {
      alive = false;
    }
  }

  void decHealth() {
    health = health - 100;
    println("health" + health);
    if (health <= 0) {
      if (getLives() == 0) {
        alive = false;
      }
      setLives(getLives() - 1);
      health = 200;
    }
  }

  void incPoints(int n) {
    points +=n;
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

