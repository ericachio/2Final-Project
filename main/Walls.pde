class Walls{
  
  int hp;
  int xcor, ycor;
  boolean alive;
  
  Walls(int x, int y){
    hp = 10;
    alive = true;
    xcor = x;
    ycor = y;
  }
  
  int getHP(){
    return hp;
  }
  
  void decHP(){
    hp-=1;
    if(hp == 0){
      alive = false;
    }
  }
  
  boolean status(){
    return alive;
  }
  
  int getX() {
    return xcor;
  }

  void setX(int n) {
      xcor = n;
  }

  int getY() {
    return ycor;
  }

  void setY(int n) {
      ycor = n;
  }
  
  void loadWall(){
    if(alive){
      rect(xcor,ycor,80,20);
      fill(80);
    }
  }
  
      
  
}
  
  
  
