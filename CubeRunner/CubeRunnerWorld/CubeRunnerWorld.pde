import ddf.minim.*;
Runner runner =  new Runner();
Cube cubes = new Cube();
Score gameScore = new Score();
AudioPlayer bgSong;
Minim minim;
//Font vars
PFont font;
PFont endFont;
//Background var
PImage bg;
boolean showTraingleOnStart = true;//used to make triangle appear before player even presses a button
int i = 50;
int max = 50;
int min = max - i;
int count = 0;
boolean alive = false;
int circleX = 0;
int circleY = 0;
int radius = 0;
boolean shot = false;

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
  if(min > 700){
 endGame();
  }else{
  if (keyCode == RIGHT && keyPressed)
    rotateZ(0.01);
  else if (keyCode == LEFT && keyPressed)
    rotateZ(-0.01);
  background(255, 255, 255);
  stroke(255, 255, 255);
  fill(225, 225, 225);
  rect(0, 250, 800, 250);

  if (keyCode == UP  && keyPressed) {
    System.out.println("UP");
    circleX = runner.getXPos() + 338;
    circleY = 422;
    radius = 10;
    shot = true;
  }
  if (shot)
    circleY-=5;
  fill(0, 0, 0);
  ellipse(circleX, circleY, radius, radius);

  font = createFont("stormfaze.ttf", 32);
  textFont(font, 32);       


  fill(0, 0, 0);
  textAlign(CENTER);  
  text("SCORE! " + gameScore.getScore(), 100, 25);

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
    translate(-runner.getXPos(), 0);
  }
  new Cube().display();

  translate(0, 250, 0);
  for (int i = 0; i < 700; i+=5) {
    if ((i < max && i > min)) {
      translate(i, 0);
      box(30);
      translate(-i, 0);
    }
  }
  max+=2;
  min+=2;
  if (circleY < 230) {
    shot = false;
    circleY = 422;
    radius = 0;
  }
  if ((circleY < 250 && circleX >= min-20 && circleX <= max+20)) {
    max = 50;
    min = max - (int)(Math.random()*40)-20;
    shot = false;
    circleY = 422;
    radius = 0;
  }
  gameScore.update();
  }
}


public void endGame() {
  endFont = createFont("stormfaze.ttf", 32);
  textFont(endFont, 32);       
  fill(0, 0, 0);
  text("THE BLOCK GOT AWAY!!", 350, 185);
  text("Your score is : " + gameScore.getScore(), 350, 225);
  text("Press the \"R\" key to restart" + score, 350, 500);
  bgSong.close();
  minim.stop();
  super.stop();
}

