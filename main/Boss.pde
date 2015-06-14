class Boss {

  int hp;
  int steps;
  int xcor, ycor;
  boolean alive;
  boolean direction;
  PImage alien;


  Boss() {
    hp = 2000;
    steps = 50;
    xcor = 350;
    ycor = 100;
    alive = true;
    direction = true;
    alien = loadImage("boss.png");
  }

  void loadAlien() {
    if (alive) {
      image(alien, xcor, ycor, 300, 200);
    } else {
      xcor = 0;
    }
  }


  void move() {  
    if (direction) {
      xcor+=2;
    } else {
      xcor-=2;
    }
    steps--;
    if (steps == 0) {
      direction = !direction;
      steps = 200;
    }
  }  

  void decHP() {
    hp-=10;
    if(hp <= 0){
      alive = false;
    }
  }

  void die() {
    alive = false;
  }

  void setX(int n) {
    xcor+=n;
  }

  void setY(int n) {
    xcor+=n;
  }
}

