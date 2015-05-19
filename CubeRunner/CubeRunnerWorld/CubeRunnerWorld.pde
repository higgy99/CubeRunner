Runner runner =  new Runner();
boolean showTraingleOnStart = true;//used to make triangle appear before player even presses a button
PImage bg;
void setup() {
  size(700, 500, OPENGL);  
  bg = loadImage("1.png");
 
}

void draw() {
 
  
  if (keyCode == RIGHT && keyPressed)
  rotateZ(0.01);
  else if(keyCode == LEFT && keyPressed)
  rotateZ(-0.01);
  background(255, 255, 255);
  stroke(255, 255, 255);
  fill(225, 225, 225);
  rect(0, 250, 699, 250);
  if (keyCode == RIGHT && keyPressed) {
   runner.increaseXPos();
  } else if (keyCode == LEFT && keyPressed) {
    runner.decreaseXPos();
  } 
  if (keyPressed || showTraingleOnStart) {
    translate(runner.getXPos(), 0);
    fill(100, 100, 100);
    stroke(225, 225, 225);
    triangle(321, 455, 338, 415, 355, 455);
    fill(225, 225, 225);
    triangle(321, 455, 338, 440, 355, 455);
  }
}


