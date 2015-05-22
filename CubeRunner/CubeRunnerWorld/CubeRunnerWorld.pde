import ddf.minim.*;
Runner runner =  new Runner();
Cube cubes = new Cube();
AudioPlayer bgSong;
Minim minim;
//Score vars
PFont font;
boolean showTraingleOnStart = true;//used to make triangle appear before player even presses a button
int numCubes = 10;
int i = 0;
int[] xPositions = new int[10];//10 cubes on the screen at once

void setup() {
  size(700, 500, OPENGL);  
  //Music setup
  minim = new Minim(this);
  bgSong = minim.loadFile("bg.mp3", 2048);
  bgSong.play();   
  createXPositions();
  bgSong.play();
  // Score setup
  font = createFont("Arial", 16, true);
}

void draw() {
  if (keyCode == RIGHT && keyPressed)
    rotateZ(0.01);
  else if (keyCode == LEFT && keyPressed)
    rotateZ(-0.01);
  background(255, 255, 255);
  stroke(255, 255, 255);
  fill(225, 225, 225);
  rect(0, 250, 800, 250);

  textFont(font, 16);       
  fill(0, 0, 0);
  textAlign(CENTER);  
  text("SCORE: ", 50, 25);

  if (keyCode == RIGHT && keyPressed) {
    runner.increaseXPos();
  } else if (keyCode == LEFT && keyPressed) {
    runner.decreaseXPos();
  } 
  if (keyPressed || showTraingleOnStart) {
    translate(runner.getXPos(), 0);
    fill(100, 100, 100);
    stroke(225, 225, 225);
    triangle(321, 455, 338, 422, 355, 455);
    fill(225, 225, 225);
    triangle(321, 455, 338, 440, 355, 455);
  }

  new Cube().display();
  for(int i = 0; i < 5; i++){
    translate(xPositions[i]- runner.getXPos(), 300);
  box(8);
  }
}

public void createXPositions() {
  for (int i = 0; i < xPositions.length; i++)
    xPositions[i] = (int)((Math.random())*650) + 25;
}

public void stop() {
  bgSong.close();
  minim.stop();
  super.stop();
}

