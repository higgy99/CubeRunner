import ddf.minim.*;
Runner runner =  new Runner();
Cube cubes = new Cube();
AudioPlayer bgSong;
Minim minim;
//Score vars
PFont font;
<<<<<<< HEAD
=======
//Background vars
PImage bg;

>>>>>>> origin/master
boolean showTraingleOnStart = true;//used to make triangle appear before player even presses a button
int numCubes = 10;
int i = 0;
int[] xPositions = new int[10];//10 cubes on the screen at once

void setup() {
<<<<<<< HEAD
=======

   //Background Setup
  bg = loadImage("bg.jpg");
  cubes.createXPositions();
>>>>>>> origin/master
  size(700, 500, OPENGL);  
  //Music setup
  minim = new Minim(this);
  bgSong = minim.loadFile("bg.mp3", 2048);
  bgSong.play();   
  createXPositions();
  bgSong.play();
  // Score setup
<<<<<<< HEAD
  font = createFont("Arial", 16, true);
}

void draw() {
  if (keyCode == RIGHT && keyPressed)
    rotateZ(0.01);
  else if (keyCode == LEFT && keyPressed)
    rotateZ(-0.01);
  background(255, 255, 255);
=======
  font = createFont("Arial",16,true); 
}

void draw() {
  background(bg);
>>>>>>> origin/master
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
<<<<<<< HEAD

  new Cube().display();
  for(int i = 0; i < 5; i++){
    translate(xPositions[i]- runner.getXPos(), 300);
  box(8);
=======
  stroke(0,205,205);
  fill(0,0,105);
  rect(30,0 ,125,50);
  textFont(font,16);       
  fill(225);
  textAlign(RIGHT);  
  text("Score:",100,25); 
}
public void stop(){
    bgSong.close();
   minim.stop();
  super.stop(); 
>>>>>>> origin/master
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

