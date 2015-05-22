Runner runner =  new Runner();
Cube cubes = new Cube();
//Music vars
import ddf.minim.*;
AudioPlayer bgSong;
Minim minim;
//Score vars
PFont font;
//Background vars
PImage bg;

boolean showTraingleOnStart = true;//used to make triangle appear before player even presses a button

void setup() {

   //Background Setup
  bg = loadImage("bg.jpg");
  cubes.createXPositions();
  size(700, 500, OPENGL);  
  //Music setup
  minim = new Minim(this);
  bgSong = minim.loadFile("bg.mp3", 2048);
  bgSong.play();
  // Score setup
  font = createFont("Arial",16,true); 
}

void draw() {
  background(bg);
  stroke(255, 255, 255);
  fill(225, 225, 225);
  rect(0, 250, 800, 250);
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
  }

