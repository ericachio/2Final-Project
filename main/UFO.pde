class UFO{
  
  int xcor, ycor;
  boolean alive;
  
  PImage ship = loadImage("ufo.png");
  
  Ufo(){
    xcor = 0;
    ycor = 80;
    alive = true;
  }
      
    
  void loadUFO() {
    if (alive == true) {
      image(ship, px, py, 40, 30);
    } else if (alive == false){
      setPosition(0);
    }
  }
  
  void move(){
    if(alive){
      xcor+=10;
    }
    if(xcor>=800){
      alive = false;
    }
  }
  
  boolean status(){
    return alive;
  }
  
  void die(){
    alive = false;
  }
  
}
