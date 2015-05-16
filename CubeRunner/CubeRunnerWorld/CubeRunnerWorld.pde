Runner runner =  new Runner();
void setup() {
  size(700, 500);
  background(255, 255, 255);
  stroke(255, 255, 255);
  fill(225, 225, 225);
  rect(0, 250, 699, 249);
}

void draw() {
  if (keyCode == RIGHT && keyPressed) {
    runner.increaseXPos();
  } else if (keyCode == LEFT && keyPressed) {
    runner.decreaseXPos();
  } 
  if (keyPressed) {
    fill(100, 100, 100);
    stroke(225, 225, 225);
    triangle(321+runner.getXPos(), 455, 338+runner.getXPos(), 415, 355+runner.getXPos(), 455);
    fill(225, 225, 225);
    triangle(321+runner.getXPos(), 455, 338+runner.getXPos(), 440, 355+runner.getXPos(), 455);
  }
}

