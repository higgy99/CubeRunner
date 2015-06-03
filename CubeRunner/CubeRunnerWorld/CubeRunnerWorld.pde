import ddf.minim.*;
Runner runner =  new Runner();
Cube cubes = new Cube();
Score gameScore = new Score();
AudioPlayer bgSong;
Minim minim;
//Font vars
PFont font;
PFont endFont;
//shape and translation vars
boolean showTraingleOnStart = true;//used to make triangle appear before player even presses a button
int i = 50;
double max = 50;
double min = max - i;
int count = 0;
int circleX = 0;
int circleY = 0;
int radius = 0;
boolean shot = false;
double blockSpeed = Math.random()*0.5 + 1;
//color
int[] blockColors = new int[3];
void setup() {
  size(700, 500, OPENGL);//game size
  minim = new Minim(this);//Music setup
  bgSong = minim.loadFile("bg.mp3", 2048);//load song
  bgSong.play();//play song
  for(int i = 0; i < blockColors.length; i++)
      blockColors[i] = (int)(Math.random() * 250 + 1);
}

void draw() {
  if (min > 700) {//if block has escaped then the game is over
    endGame();
    if (key == 'r' && keyPressed) {
      restartGame();//constanly checking if user has pressed r to restart the game4
    }
  } else {
    if (keyCode == RIGHT && keyPressed)
      rotateZ(0.01);
    else if (keyCode == LEFT && keyPressed)
      rotateZ(-0.01);
    background(255, 255, 255);
    stroke(255, 255, 255);
    fill(225, 225, 225);
    rect(0, 250, 800, 250);

    if (keyCode == UP  && keyPressed) {
      circleX = runner.getXPos() + 338;
      circleY = 422;
      radius = 10;
      shot = true;//bullet was shot
    }
    if (shot)//if bullet was shot, then move bullet
        circleY-=5;
     fill((int)((Math.random())*255 + 100), (int)((Math.random())*225 - 100), (0));
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
    fill(blockColors[0], blockColors[1], blockColors[2]);
    for (int i = 0; i < 700; i+=5) {
      if ((i < max && i > min)) {
        translate(i, 0);
        box(30);
        translate(-i, 0);
      }
    }
    max+=blockSpeed;//speed of block
    min+=blockSpeed;

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
      blockSpeed+=0.5;//speeds up block as you get further
      for(int i = 0; i < blockColors.length; i++)
      blockColors[i] = (int)(Math.random() * 250 + 1);
    }
    gameScore.update();
  }
}


public void endGame() {
  endFont = createFont("stormfaze.ttf", 32);
  textFont(endFont, 32);       
  fill(0, 0, 0);
  text("THE BLOCK GOT AWAY!!", 350, 135);
  text("Your score is : " + gameScore.getScore(), 350, 195);
  text("Press the \"R\" key to restart", 350, 285);
  bgSong.close();
}

public void restartGame() {
  gameScore.resetScore();
  runner.resetRunnerPos();
  max = 50;
  min = 0;
  bgSong = minim.loadFile("bg.mp3", 2048);
  bgSong.play();
  blockSpeed = Math.random()*0.5 + 1;
}

