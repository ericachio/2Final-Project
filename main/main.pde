import java.util.*;
import ddf.minim.*;


//plz work
int mode; //mode 0 is the menu & 1 is uctions
int count;
int level;
PImage menu, instructions, end, win, arrow, back;
PImage alien1, alien2, alien3, ship;
boolean fired;
boolean wall = false;
Player player;
Boss bAlien;
UFO oof;

List<Bullet> bullets;
aliens[] aliens_ = new aliens[40];
Walls[] walls_ = new Walls[4];

Random rand = new Random();

Minim boss_, ufoo_, shoot_, killed_, explode_;
AudioPlayer boss, ufoo, shoot, killed, explode;


void setup() {
  size(800, 600);
  mode = 0;
  count = 40;
  menu = loadImage("menu.png");
  instructions = loadImage("instructions.png");
  end = loadImage("gameover2.png");
  win = loadImage("end.jpg");
  alien1 = loadImage("alien1.png");
  alien2 = loadImage("alien2.png");
  alien3 = loadImage("alien3.png");
  ship = loadImage("ship.png");
  arrow = loadImage("arrowkeys.jpg");
  back = loadImage("space.jpg");
  player = new Player();
  bAlien = new Boss();
  oof = new UFO();
  bullets = new ArrayList<Bullet>();
  loadA();
  loadW();
  level = 1;
  boss_ = new Minim(this);
  boss = boss_.loadFile("battle2.mp3");
  ufoo_ = new Minim(this);
  ufoo = ufoo_.loadFile("ufolow.wav");
  shoot_ = new Minim(this);
  shoot = shoot_.loadFile("shoot.wav");
  killed_ = new Minim(this);
  killed = killed_.loadFile("killed.wav");
  explode_ = new Minim(this);
  explode = explode_.loadFile("explosion.wav");
}

void draw() {
  background(0);
  if (mode == 0) {
    if (boss.isPlaying()) {
      boss.pause();
    }
    Menu();
  }
  if (mode == 1) {
    if (boss.isPlaying()) {
      boss.pause();
    }
    Instructions();
  }
  if (mode == 2) {
    if (boss.isPlaying()) {
      boss.pause();
    }
    Background();
    fill(100);
    play();
  }
  if (mode == 3) {
    if (boss.isPlaying()) {
      boss.pause();
    }
    GameOver();
  }
  if (mode == 4) {
    Background();
    fill(100);
    bosslevel();
  }
  if (mode == 5) {
    YouWin();
  }
}

void play() {
  Background();
  player.loadPlayer();
  player.mode();
  if (!oof.alive && rand.nextInt(1300) == 1) {
    oof = new UFO(rand.nextInt(2)==0);
  }
  if (oof.alive) {
    ufoo.play();
  }else{
    ufoo.rewind();
    ufoo.pause();
  }
  oof.move();
  oof.load();
  for (aliens a : aliens_) {
    a.loadAlien();
    a.action();
    a.moveAlien();
    if (a.alive && a.getPY()>500) {
      mode = 3;
    }
    for (Walls w : walls_) {
      w.loadWall();
    }
  }
  alienAttack();
  collision();
  if (count == 0) {
    boss.loop();
    bullets = new ArrayList<Bullet>();
    mode = 4;
    player.lives++;
  }
}

void bosslevel() {
  player.loadPlayer();
  player.mode();
  bAlien.move();
  bAlien.loadAlien();
  bAlien.displayHP();
  if (!bAlien.alive) {
    explode.rewind();
    explode.play();
    mode = 5;
  }
  for (Walls w : walls_) {
    fill(0, 225, 0);
    w.loadWall();
  }
  for ( Bullet b : bullets) {
    if (b.isFired()) {
      b.shoot();
      b.setY(7);
    }
  }
  if (rand.nextInt(100) > 98 && bAlien.alive) {
    attack();
  }
  collide();
}

void Menu() {
  image(menu, 100, 30, 600, 550);
  if (mouseX >= 346 && mouseX <= 455 &&
    mouseY >= 455 && mouseY <= 480) {
    fill(0, 255, 30);
  } else { 
    fill(255);
  }
  textSize(36);
  textAlign(CENTER);
  text("Start", 400, 480);
  if (mouseX >= 295 && mouseX <= 505 &&
    mouseY >= 508 && mouseY <= 535) {
    fill(0, 255, 30);
  } else { 
    fill(255);
  }
  textSize(36);
  textAlign(CENTER);
  text("Instructions", 400, 530);
}

void Instructions() {
  image(instructions, 100, 30, 600, 550);
  if ( mouseX >= 360 && mouseX <= 450 &&
    mouseY >= 475 && mouseY <= 505) {
    fill(0, 255, 30);
  } else { 
    fill(255);
  }
  textSize(36);
  textAlign(CENTER);
  text("Start", 400, 500);
}

void GameOver() {
  image(end, 0, 0, 800, 600);
  if (mouseX >= 300 && mouseX <= 500 && 
    mouseY >= 440 && mouseY <= 490) {
    fill(0, 255, 30);
  } else { 
    fill(255);
  }
  textSize(36);
  textAlign(CENTER);
  text("Play Again?", 400, 480);
}

void YouWin() {
  image(win, 0, 50, 800, 600);
  if (mouseX >= 300 && mouseX <= 500 && 
    mouseY >= 440 && mouseY <= 490) {
    fill(0, 255, 30);
  } else { 
    fill(255);
  }
  textSize(36);
  textAlign(CENTER);
  text("Play Again?", 400, 480);
}


void Background() {
  fill(255, 255, 255);
  textSize(22);
  textAlign(LEFT);
  text("Score: "+player.points, 50, 50);
  textAlign(RIGHT);
  text("Lives: ", 600, 50);
  textAlign(CENTER);
  text("Player Level: "+player.level, 300, 50);
  for (int i = 0; i < player.getLives (); i++) {
    image(ship, 630 + i*45, 28, 30, 20);
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
  text("Play Again", 400, 200);
  fill(225);
}

void loadA() {
  int x = 100;
  int y = 100;
  for (int i = 0; i < 10; i++) {
    aliens_[i] = new aliens(x, y, 3);
    x+=60;
  }
  x = 100;
  y = 160;
  for (int i = 10; i < 20; i++) {
    aliens_[i] = new aliens(x, y, 2);
    x+= 60;
  }  
  x = 100;
  y = 220;
  for (int i = 20; i < 30; i++) {
    aliens_[i] = new aliens(x, y, 1);
    x+=60;
  }
  x = 100;
  y = 280;
  for (int i = 30; i < 40; i++) {
    aliens_[i] = new aliens(x, y, 1);
    x+=60;
  }
}

void loadW() {
  int j = 60;
  for (int i = 0; i < 4; i++) {
    walls_[i] = new Walls(j, 500);
    j+=200;
  }
}

void alienAttack() {
  for (aliens a : aliens_) {
    if (a.alive) {
      if (rand.nextInt(100000) == 1) {
        bullets.add(new Bullet(a.getPX()+25, a.getPY()+25, 1, false));
      }
      if (a.getPX() == player.getX() && rand.nextInt(100) > 90) {
        bullets.add(new Bullet(a.getPX()+25, a.getPY()+25, 1, false));
        //println("ayyeyeey");
      }
    }
  }
}

void attack() {
  bullets.add(new Bullet(bAlien.xcor+80, bAlien.ycor+150, 1, false));
  bullets.add(new Bullet(bAlien.xcor+150, bAlien.ycor+170, 1, false));
  bullets.add(new Bullet(bAlien.xcor+220, bAlien.ycor+150, 1, false));
}


void collide() {
  for (Bullet b : bullets) {
    if (bAlien.alive && b.player) {
      if (b.getX() >= bAlien.xcor && b.getX() <= bAlien.xcor+300 &&
        b.getY() >= bAlien.ycor && b.getY() <= bAlien.ycor+180) {
        bAlien.decHP();
        b.setH(true);
        player.incPoints(10);
        println("score "+player.points); 
        //println("shot" + b.getX());
      }
    } else if (bAlien.alive && !b.player) {
      println(b.getX());
      if (b.getX() >= player.getX() && b.getX() <= player.getX()+50 &&
        b.getY() >= player.getY() && b.getY() <= player.getY()+40) {
        explode.rewind();
        explode.play();
        b.setH(true);
        player.decLives();
        if (!player.alive) {
          mode = 3;
        }
      }
    }
    for (Walls w : walls_) {
      if (b.getX() >= w.getX() && b.getX() <= w.getX()+80 &&
        b.getY() >= w.getY() && b.getY() <= w.getY()+20) {
        b.setH(true);
        w.decHP();
        println("shot" + b.getX());
      }
    }
  }
}

void collision() {
  for ( Bullet b : bullets) {
    if (b.isFired()) {
      b.shoot();
      b.setY(7);
      if (b.player && oof.status() &&
        b.getX() >= oof.getX() && b.getX() <= oof.getX()+40 &&
        b.getY() >= oof.getY() && b.getY() <= oof.getY()+30) {
        oof.die();
        b.setH(true);
        player.incPoints(100);
        //println("oops");
      }
      for (aliens a : aliens_) {
        if (a.alive && b.player) {
          if (b.getX() >= a.getPX() && b.getX() <= a.getPX()+40 &&
            b.getY() >= a.getPY() && b.getY() <= a.getPY()+30) {
            killed.rewind();
            killed.play();
            a.setS(false);
            b.setH(true);
            count--;
            player.incPoints(a.level * 10);
            println("alevel "+a.level);
            println("score "+player.points); 
            //println("shot" + b.getX());
          }
        }
      }
      for (Walls w : walls_) {
        if (b.getX() >= w.getX() && b.getX() <= w.getX()+80 &&
          b.getY() >= w.getY() && b.getY() <= w.getY()+20) {
          b.setH(true);
          w.decHP();
          println("shot" + b.getX());
        }
      }
      if (b.getX() >= player.getX() && b.getX() <= player.getX()+50 &&
        b.getY() >= player.getY() && b.getY() <= player.getY()+40) {
        explode.rewind();
        explode.play();
        b.setH(true);
        player.decLives();
        if (!player.alive) {
          mode = 3;
        }
      }
    }
  }
}



void mouseClicked() {
  println(mouseX + ", " + mouseY);
  if (mouseX >= 295 && mouseX <= 505 &&
    mouseY >= 508 && mouseY <= 535 && mode == 0) {
    mode = 1; //instr
  } else if (mouseX >= 346 && mouseX <= 455 &&
    mouseY >= 455 && mouseY <= 480 && mode == 0) {
    mode = 2; //play
  } else if ( mouseX >= 360 && mouseX <= 450 &&
    mouseY >= 475 && mouseY <= 505 && mode == 1) {
    mode = 2;
  } else if (mouseX >= 300 && mouseX <= 500 && 
    mouseY >= 440 && mouseY <= 490 && mode == 3) {
    setup();
  } else if (mouseX >= 300 && mouseX <= 500 && 
    mouseY >= 440 && mouseY <= 490 && mode == 5) {
    if (boss.isPlaying()) {
      boss.pause();
    }
    setup();
  }
}

void keyPressed() {
  println(keyCode);
  if (keyCode==37 && (mode==2 || mode == 4)) {
    player.setX(player.getX()-20);
  }
  if (keyCode==39 && (mode==2 || mode == 4)) {
    player.setX(player.getX()+20);
  }

  if (keyCode==32 && mode==2) {
    fired = false;
    for (Bullet b : bullets) {
      if (b.player) {
        if (b.fired) {
          fired = true;
        }
      }
    }
    if (!fired) {
      if (player.level == 1) {
        bullets.add(new Bullet(player.getX()+25));
        shoot.rewind();
        shoot.play();
      } else if (player.level == 2) {
        bullets.add(new Bullet(player.getX()+25, player.getY()-40));
        bullets.add(new Bullet(player.getX()+25, player.getY()));
        shoot.rewind();
        shoot.play();
      } else if (player.level > 2) {
        bullets.add(new Bullet(player.getX()+5));
        bullets.add(new Bullet(player.getX()+25, player.getY()-20));
        bullets.add(new Bullet(player.getX()+45));
        shoot.rewind();
        shoot.play();
      }
    }
  }
  if (keyCode == 32 && mode ==4) {
    bullets.add(new Bullet(player.getX()+20));
    bullets.add(new Bullet(player.getX()+30));
    shoot.rewind();
    shoot.play();
  }
  if (keyCode==82) {
    setup();
  }
  if (keyCode == 79) {
    setup();
    boss.loop();
    mode = 4;
    player.lives++;
  }
  if (keyCode == 87) {
    player.lives++;
  }
}

