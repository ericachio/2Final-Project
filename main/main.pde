
int mode; //mode 0 is the menu & 1 is instructions
PImage arrow;
boolean fired = false;
Player player;

aliens alien;


void setup() {
  size(800, 600);
  background(0, 0, 0);
  mode = 0;
  arrow = loadImage("arrowkeys.jpg");
  player = new Player();
  alien = new aliens();
  //load();
}

void draw() {
  background(0, 0, 0);
  if (mode == 0) {
    displayMenu();
  }
  if (mode == 1) {
    displayInstructions();
  }
  if (mode == 2) {
    play();
  }
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

void load() {
  int positionx = 100;
  int positiony = 100;
  for (int i = positionx; i < 700; i += 160) {
    for (int j = positiony; j < 400; j += 160) {
      alien.loadAlien(i, j);
    }
  }
  player.loadPlayer();
  if(player.getStatus()){
    player.setBY(player.getBY()-10);
    player.shoot();
  }
}

void play() {
  load();
  alien.move(alien.getPX(), alien.getPY());
}


void mouseClicked() {
  if (mouseX >= 290 && mouseX <= 515 &&
    mouseY >= 260 && mouseY <= 310) {
    mode = 1;
    println("mode 1");
  } else if (mouseX >= 290 && mouseX <= 515 &&
    mouseY >= 160 && mouseY < 310) {
    mode = 2;
    println(mouseX + ", " + mouseY);
  }
}

void keyPressed(){
  println(keyCode);
  if(keyCode==37 && mode==2) {
    player.setX(player.getX()-15);
  }
  if(keyCode==39 && mode==2){
    player.setX(player.getX()+15);
  }
  if(keyCode==32 && mode==2){
    player.setStatus(true);
    player.setBX(player.getX()+25);
    player.setBY(player.getY()+5);
    player.shoot();
  }
  
}

