int mode;
//mode 0 is the menu & 1 is instructions


void setup() {
  size(800, 600);
  background(0, 0, 0);
  mode = 0;
}

void draw() {
  background(0, 0, 0);
  if (mode == 0) {
    displayMenu();
  }
  if (mode == 1){
      displayInstructions();
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

void displayInstructions(){
  textSize(64);
  textAlign(CENTER);
  text("Instructions", 400, 100);
  textSize(36);
  textAlign(CENTER);
  
}

void mouseClicked() {
  if (mouseX >= 290 && mouseX <= 515 &&
    mouseY >= 260 && mouseY < 310) {
      mode = 1;
      println(mouseX + ", " + mouseY);
  }
}

