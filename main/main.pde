import java.util.*;

//plz work
int mode; //mode 0 is the menu & 1 is instructions
PImage arrow, menu, instructions;
boolean fired = false;
Player player;

List<Bullet> bullets = new ArrayList<Bullet>();

aliens a1;
aliens a2;
aliens a3;
aliens a4;


void setup() {
  size(800, 600);
  background(0, 0, 0);
  mode = 0;
  arrow = loadImage("arrowkeys.jpg");
  menu = loadImage("menu.png");
  instructions = loadImage("instructions.png");
  player = new Player();
  a1 = new aliens();
  a2 = new aliens();
  a3 = new aliens();
  a4 = new aliens();
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
    play();
  }
  if (mode == 3) {
    displayGO();
  }
}

void Menu(){
  image(menu, 100, 30, 600, 550);
}

void Instructions(){
  image(instructions, 100, 30, 600, 550);
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
  a1.loadAlien(100, 100);
  a2.loadAlien(260, 100);
  a3.loadAlien(420, 100);
  a4.loadAlien(560, 100);
}

//
void play() {
  player.loadPlayer();
  //loadA();
  a1.move(a1.getPX(), a1.getPY());
  if (a1.playerAlive == false) {
    mode = 3;
  }
  a2.move(a2.getPX(), a2.getPY());
  a3.move(a3.getPX(), a3.getPY());
  a4.move(a4.getPX(), a4.getPY());
  //alien.move(alien.getPX(), alien.getPY());
  for( Bullet b:bullets){
    if(b.isFired()){
      b.shoot();
      b.setY(b.getY()-5);
    }
  }
  }



void mouseClicked() {
   println(mouseX + ", " + mouseY);
  if (mouseX >= 300 && mouseX <= 505 &&
    mouseY >= 508 && mouseY <= 535 && mode == 0) {
    mode = 1; //instr
  }else if (mouseX >= 346 && mouseX <= 455 &&
    mouseY >= 455 && mouseY <= 480 && mode == 0) {
    mode = 2; //play
  }else if (mouseX >= 346 && mouseX <= 455 &&
    mouseY >= 484 && mouseY <= 505 && mode == 1){
    mode = 2;
  }
}

void keyPressed() {
  println(keyCode);
  if (keyCode==37 && mode==2) {
    player.setX(player.getX()-15);
  }
  if (keyCode==39 && mode==2) {
    player.setX(player.getX()+15);
  }
  if (keyCode==32 && mode==2) {
    bullets.add(new Bullet(player.getX()+25));
  }
}

