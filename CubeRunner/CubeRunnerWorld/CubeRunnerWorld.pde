import ddf.minim.*;
Runner runner =  new Runner();
Cube cubes = new Cube();
Score gameScore = new Score();
AudioPlayer bgSong;
Minim minim;
//Score var
PFont font;
//Background var
PImage bg;
boolean showTraingleOnStart = true;//used to make triangle appear before player even presses a button
int numCubes = 10;
int i = 50;
int[] xPositions = new int[20];//10 cubes on the screen at once
void setup() {
  createXPositions();
  size(700, 500, OPENGL);
  //Background Setup
  //Music setup
  minim = new Minim(this);
  bgSong = minim.loadFile("bg.mp3", 2048);
  bgSong.play();   
  createXPositions();
  bgSong.play();
  // Score setup
  font = createFont("Monofett.ttf", 32);
 
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
  if (gameScore.getScore() >= 1000)
    background(0, 0, 0);
  textFont(font, 32);       
  if (gameScore.getScore() >= 1000)
    fill(0, 255, 0);
  else
    fill(0, 0, 0);
  textAlign(CENTER);  
  text("SCORE: " + gameScore.getScore(), 95, 25);



  if (keyCode == RIGHT && keyPressed) {
    runner.increaseXPos();
  } else if (keyCode == LEFT && keyPressed) {
    runner.decreaseXPos();
  } 
  if (keyPressed || showTraingleOnStart) {
    translate(runner.getXPos(), 0);
    fill(100, 100, 100);
    stroke(225, 225, 225);
    if (gameScore.getScore() >= 1000) {
      stroke(0, 0, 0);
      fill(0, 255, 0);
    }
    triangle(321, 455, 338, 422, 355, 455);
    fill(225, 225, 225);
    if (gameScore.getScore() >= 1000) {
      stroke(0, 0, 0);
      fill(0, 0, 0);
    }
    triangle(321, 455, 338, 440, 355, 455);
    translate(-runner.getXPos(), 0);
  }
  new Cube().display();
  if (gameScore.getScore() >= 1000) {
    stroke(0, 255, 0);
    fill(0, 0, 0);
  }
  translate(0, 250, i);
  for (int i = 0; i < 10; i++) {
    translate(xPositions[i], 0);
    box(7);
    translate(-xPositions[i], 0);
  }
  i+=4;
  if (i > 400) {
    i = 200;
    createXPositions();
  }
  gameScore.update();
}

public void createXPositions() {
  for (int i = 0; i < xPositions.length; i++)
    xPositions[i] = (int)((Math.random())*550) + 150;
}

public void stop() {
  bgSong.close();
  minim.stop();
  super.stop();
}

