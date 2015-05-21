Runner runner =  new Runner();
<<<<<<< HEAD
Cube cubes = new Cube();
=======
import ddf.minim.*;
AudioPlayer bgSong;
Minim minim;
>>>>>>> origin/master
boolean showTraingleOnStart = true;//used to make triangle appear before player even presses a button

void setup() {
<<<<<<< HEAD
  cubes.createXPositions();
  size(700, 500, OPENGL);  
  
}

void draw() {
=======
  size(700, 500, OPENGL); 
  minim = new Minim(this);
  bgSong = minim.loadFile("bg.mp3", 2048);
  bgSong.play(); 
}

void draw() {
  
>>>>>>> origin/master
  
  if (keyCode == RIGHT && keyPressed)
  rotateZ(0.01);
  else if(keyCode == LEFT && keyPressed)
  rotateZ(-0.01);
  background(255, 255, 255);
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
    triangle(321, 455, 338, 422/*penis*/, 355, 455);
    fill(225, 225, 225);
    triangle(321, 455, 338, 440, 355, 455);
  }
  
   cubes.display();
}
public void stop(){
    bgSong.close();
   minim.stop();
  super.stop(); 
  }

