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
int i = 50;
int max = 0;
int min = 0;
void setup() {
  size(700, 500, OPENGL);
  //Background Setup
  //Music setup
  minim = new Minim(this);
  bgSong = minim.loadFile("bg.mp3", 2048);
  bgSong.play();   
  bgSong.play();
  // Score setup
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

font = createFont("Monofett.ttf", 32);
  textFont(font, 32);       
  fill(0, 0, 0);
  if (gameScore.getScore() >= 1000) {
    stroke(0, 0, 0);
    fill(0, 255, 0);
  }
  textAlign(CENTER);  
  text("SCORE: " + gameScore.getScore(), 100, 25);
  
  if (gameScore.getScore() >= 1000)
    background(0, 0, 0);
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
  if (i > 390) {
    max = (int)(Math.random()*150)+300;
    min = max - 30;
  }
  translate(0, 250, i);
  for (int i = 0; i < 700; i+=7) {
    if (!(i < max && i > min)) {
      translate(i, 0);
      box(7);
      translate(-i, 0);
    }
  }
  i+=4;
  if (i > 400) {
    i = 100;
  }
  gameScore.update();
}

public void stop() {
  bgSong.close();
  minim.stop();
  super.stop();
}

