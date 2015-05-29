class Player{
  
  PImage ship;
  
  int health;
  int points;
  int coins;
  int lives;
  int level;
  int xcor;
  
  void Player(){
    health = 200;
    points = 0;
    coins = 0;
    lives = 3;
    level = 1;
    xcor = 400;
    ship = loadImage("ship.png");
  }

  void loadPlayer(){
     image(ship, xcor, 580);
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
    
  

