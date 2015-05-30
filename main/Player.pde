class Player{
  
  PImage ship;
  
  int health;
  int points;
  int coins;
  int lives;
  int level;
  int xcor, ycor;
  
  class Bullet{
    
    int level;
    int count;
    int xcor, ycor;
    
    Bullet(int l,int x, int y){
      level = l;
      xcor = x;
      ycor = y;
    }
    
    void loadBullet(){
      ellipse(xcor, ycor, 10, 30);
    }
    
    int getLevel(){
      return level;
    }
    
    void setLevel(int n){
      level = n;
    }
    
    int getY(){
      return ycor;
    }
    
    void setY(int n){
      ycor = n;
    }
    
  }
    
        
  
  Player(){
    health = 200;
    points = 0;
    coins = 0;
    lives = 3;
    level = 1;
    xcor = 380;
    ycor = 550;
  }

  void loadPlayer(){
     ship = loadImage("ship.png");
     image(ship, xcor, ycor, 50, 40);
  }

  void shoot(int x, int y){
     Bullet b = new Bullet(level, x, y);
  }
    
  int getHealth(){
    return health;
  }

  void setHealth(int n){
    health = n;
  }
  
  int getPoints(){
    return points;
  }
  
  void setPoints(int n){
    points = n;
  }
  
  int getCoins(){
    return coins;
  }
  
  void setCoins(int n){
    coins = n;
  }
  
  int getLives(){
    return lives;
  }
  
  void setLives(int n){
    lives = n;
  }
 
  int getLevel(){
    return level;
  }

  void setLevel(int n){
    level = n;
  }
  
  int getX(){
    return xcor;
  }
  
  void setX(int n){
    if(n > 0 && n < 800){
     xcor = n;
    }
  }
  
}  
    
  

