import java.util.*;

//plz work
int mode; //mode 0 is the menu & 1 is instructions
int count = 5;
PImage arrow, menu, instructions, alien;
boolean fired = false;
Player player;

List<Bullet> bullets = new ArrayList<Bullet>();

aliens[] aliens_ = new aliens[30];



void setup() {
  size(800, 600);
  background(0, 0, 0);
  mode = 0;
  arrow = loadImage("arrowkeys.jpg");
  menu = loadImage("menu.png");
  alien = loadImage("alien.jpg");
  instructions = loadImage("instructions.png");
  player = new Player();
  loadA();
}

void draw() {
  background(0, 0, 0);
  if (mode == 0) {
    Menu();
  }
  if (mode == 1) {
    Instructions();
  }
  if (mode == 2) {
    Background();
    play();
  }
  if (mode == 3) {
    displayGO();
  }
}

void Menu() {
  image(menu, 100, 30, 600, 550);
}

void Instructions() {
  image(instructions, 100, 30, 600, 550);
}

void Background(){
  textSize(22);
  text("Score: "+player.getPoints(), 50, 50);
  text("
}

void displayMenu() {
  //title of game
  textSize(64);
  textAlign(CENTER);
  text("SPACE INVADERS", 400, 100); 
  //instruction button
  textSize(36);
  rect(290, 260, 225, 50);
  fill(0);
  text("Instructions", 400, 300);
  fill(225);  
  //start button
  rect(290, 160, 225, 50);
  fill(0);
  text("Play Game", 400, 200);
  fill(225);
}

void displayInstructions() {
  textSize(64);
  textAlign(CENTER);
  text("Instructions", 400, 100);
  image(arrow, 130, 150);
  textSize(24);        
  textAlign(LEFT);
  text("Press left and right", 330, 200);
  text("arrow keys to move player", 330, 230);
  text("Press spacebar to shoot aliens", 330, 260);
}

void displayGO() {
  textSize(64);
  textAlign(CENTER);
  text("game over", 400, 100);
}

void loadA() {
  int x = 100;
  int y = 100;
  for (int i = 0; i < 10; i++) {
    aliens_[i] = new aliens(x, y, 3);
    x+=60;
  }
  x = 100;
  y = 200;
  for (int i = 10; i < 20; i++) {
    aliens_[i] = new aliens(x, y, 2);
    x+= 60;
  }  
  x = 100;
  y = 300;
  for (int i = 20; i < 30; i++) {
    aliens_[i] = new aliens(x, y, 1);
    x+=60;
  }
}

//
void play() {
  player.loadPlayer();
  for(aliens a: aliens_){
    a.moveAlien();
    a.loadAlien();
  }
  for ( Bullet b : bullets) {
    if (b.isFired()) {
      b.shoot();
      b.setY(b.getY()-10);
    }
  }
}



void mouseClicked() {
  println(mouseX + ", " + mouseY);
  if (mouseX >= 300 && mouseX <= 505 &&
    mouseY >= 508 && mouseY <= 535 && mode == 0) {
    mode = 1; //instr
  } else if (mouseX >= 346 && mouseX <= 455 &&
    mouseY >= 455 && mouseY <= 480 && mode == 0) {
    mode = 2; //play
  } else if (mouseX >= 346 && mouseX <= 455 &&
    mouseY >= 484 && mouseY <= 505 && mode == 1) {
    mode = 2;
  }
}

void keyPressed() {
  println(keyCode);
  if (keyCode==37 && mode==2) {
    player.setX(player.getX()-20);
  }
  if (keyCode==39 && mode==2) {
    player.setX(player.getX()+20);
  }
<<<<<<< HEAD
  if (keyCode==32 && mode==2) {
    bullets.add(new Bullet(player.getX()+25));
=======
  if(keyCode==32 && mode==2){
    
>>>>>>> player
  }
}

