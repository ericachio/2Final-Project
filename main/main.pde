import java.util.*;

//plz work
int mode; //mode 0 is the menu & 1 is instructions
int count = 5;
PImage arrow, menu, instructions, alien, ship;
boolean fired = false;
Player player;
int level;

List<Bullet> bullets = new ArrayList<Bullet>();
aliens[] aliens_ = new aliens[30];
Walls[] walls_ = new Walls[4];

Random rand = new Random();


void setup() {
  size(800, 600);
  background(0, 0, 0);
  mode = 0;
  arrow = loadImage("arrowkeys.jpg");
  menu = loadImage("menu.png");
  alien = loadImage("alien.jpg");
  ship = loadImage("ship.png");
  instructions = loadImage("instructions.png");
  player = new Player();
  loadA();
  loadW();
  level = 1;
}

void draw() {
  background(0, 0, 0);
  if (mouseX >= 300 && mouseX <= 505 &&
    mouseY >= 508 && mouseY <= 535 && mode == 0) {
    //instr
  } else if (mouseX >= 346 && mouseX <= 455 &&
    mouseY >= 455 && mouseY <= 480 && mode == 0) {
    //play
  } else if (mouseX >= 346 && mouseX <= 455 &&
    mouseY >= 484 && mouseY <= 505 && mode == 1) {
    //play
  }
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

void Background() {
  textSize(22);
  text("Score: "+player.getPoints(), 20, 50);
  text("Lives: "+player.getLives(), 580, 50);
  text("Level: "+level, 300, 50);
  for (int i = 0; i < player.getLives (); i++) {
    image(ship, 670 + i*45, 28, 30, 30);
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
  text("Play Again", 400, 200);
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
  textSize(36);
  rect(290, 160, 225, 50);
  fill(0);
  text("Play Game", 400, 200);
  fill(225);
}

void endGame() {
}  

void loadA() {
  int x = 100;
  int y = 100;
  for (int i = 0; i < 10; i++) {
    aliens_[i] = new aliens(x, y, level);
    x+=60;
  }
  x = 100;
  y = 180;
  for (int i = 10; i < 20; i++) {
    aliens_[i] = new aliens(x, y, level);
    x+= 60;
  }  
  x = 100;
  y = 260;
  for (int i = 20; i < 30; i++) {
    aliens_[i] = new aliens(x, y, level);
    x+=60;
  }
}

void loadW() {
  int j = 100;
  for (int i = 0; i < 4; i++) {
    walls_[i] = new Walls(j, 500);
    j+=200;
  }
}


void alienAttack() {
  for (aliens a : aliens_) {
    if (a.getPX() == player.getX() && rand.nextInt(100) > 50) {
      bullets.add(new Bullet(a.getPX()+25, a.getPY()+25, 1, false));
      println("ayyeyeey");
    }
  }
}

void play() {
  player.loadPlayer();
  for (aliens a : aliens_) {
    a.moveAlien();
    a.loadAlien();
  }
  for (Walls w : walls_) {
    w.loadWall();
  }
  alienAttack();
  for ( Bullet b : bullets) {
    if (b.isFired()) {
      b.shoot();
      b.setY(7);
      if (b.player == true) {
        for (aliens a : aliens_) {
          if (b.getX() >= a.getPX() && b.getX() <= a.getPX()+40 &&
            b.getY() >= a.getPY() && b.getY() <= a.getPY()+30) {
            a.setS(false);
            b.setH(true);
            player.setPoints(player.getPoints() + 10);
            //println("shot" + b.getX());
          }
        }
      }
      for (Walls w : walls_) {
        if (b.getX() >= w.getX() && b.getX() <= w.getX()+80 &&
          b.getY() >= w.getY() && b.getY() <= w.getY()+20) {
          b.setH(true);
          w.decHP();
          player.setPoints(player.getPoints() + 10);
          //println("shot" + b.getX());
        }
      }
      if (b.getX() >= player.getX() && b.getX() <= player.getX()+50 &&
        b.getY() >= player.getY() && b.getY() <= player.getY()+40) {
        b.setH(true);
        player.decHealth();
        if (player.alive == false) {
          mode = 3;
        }
      }
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
  } else if (mouseX >= 290 && mouseX <= 515 &&
    mouseY >= 160 && mouseY <= 210 && mode == 3) {
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

  if (keyCode==32 && mode==2) {
    bullets.add(new Bullet(player.getX()+25));
  }
  if (keyCode==82) {
    mode = 0;
    loadA();
  }
}

