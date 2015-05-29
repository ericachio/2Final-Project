class Player{
  
  int health;
  int points;
  int coins;
  int lives;
  int level;
  
  void Player(){
    health = 200;
    points = 0;
    coins = 0;
    lives = 3;
    level = 1;
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

}  
    
  

