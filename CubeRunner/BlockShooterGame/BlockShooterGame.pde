import ddf.minim.*;
Runner runner =  new Runner();//create a runner
Cube cubes = new Cube();//create a cube
Score gameScore = new Score();//instantiate object that deals with game score
AudioPlayer bgSong;//background music
Minim minim;//used for music
//Font vars
PFont font;
PFont endFont;
//shape and translation vars
boolean showTraingleOnStart = true;//used to make triangle appear before player even presses a button
int i = 50;
double max = 50;
double min = max - i;
int circleX = 0;
int circleY = 0;
int radius = 0;
boolean shot = false;//tells whether a bullet has been shot
double blockSpeed = Math.random()*0.5 + 1;//intial spped of block starts randomly
//color
int[] blockColors = new int[3];//3 numbers for rgb
void setup() {
  size(700, 500, OPENGL);//game size--3D rendering
  minim = new Minim(this);//Music setup
  bgSong = minim.loadFile("bg.mp3", 2048);//load song
  bgSong.play();//play song
  for(int i = 0; i < blockColors.length; i++)
      blockColors[i] = (int)(Math.random() * 250 + 1);//create random color for blocks
}

void draw() {
  if (min > 700) {//if block has escaped then the game is over
    endGame();
    if (key == 'r' && keyPressed) {
      restartGame();//constanly checking if user has pressed r to restart the game4
    }
  } else {
    if (keyCode == RIGHT && keyPressed)
      rotateZ(0.01);//rotate screen as runner moves right
    else if (keyCode == LEFT && keyPressed)
      rotateZ(-0.01);//rotate screen as runner moves left
    background(255, 255, 255);//background color of game
    stroke(255, 255, 255);//border of rectangle
    fill(225, 225, 225);//color of rectangle
    rect(0, 250, 800, 250);//the rectangle on which the runner lays

    if (keyCode == UP  && keyPressed) {//checks if user tried to shoot
      circleX = runner.getXPos() + 338;//shoots bullet from runner x-coordinate
      circleY = 422;//shoots bullet from runner y-coordinate
      radius = 10;//gives bullet a radius so it is visible
      shot = true;//bullet was shot
    }
    if (shot)//if bullet was shot, then move bullet
        circleY-=5;
     fill((int)((Math.random())*255 + 100), (int)((Math.random())*225 - 100), (0));//makes the bullet shot blink red and yellow 
    ellipse(circleX, circleY, 5, radius);//creates bullet

    font = createFont("stormfaze.ttf", 32);//create font for score
    textFont(font, 32);//apply font and font size 
    fill(0, 0, 0);//make text black
    textAlign(CENTER);//positions text
    text("SCORE! " + gameScore.getScore(), 100, 25);//displays text

    if (keyCode == RIGHT && keyPressed) {//moves runner right with right arrow
      runner.increaseXPos();
    } else if (keyCode == LEFT && keyPressed) {//moves runner left with left arrow
      runner.decreaseXPos();
    } 
    
      translate(runner.getXPos(), 0);//moves runner according to user input
      fill(100, 100, 100);//makes triangle blend in with background--it is laid on top of another grey triangle to mak it look like an arrow
      stroke(225, 225, 225);//gives runner a border that blends in with background
      triangle(321, 455, 338, 422, 355, 455);//triangle one is created
      fill(225, 225, 225);//make runner grey
      triangle(321, 455, 338, 440, 355, 455);//give runner shape-- another shorter triangle that blends in with its background will be layered on top of it to give it an arrow shape
      translate(-runner.getXPos(), 0);//undo translate so it is does not carry over 
   

    new Cube().display();//apply style of blocks(blocks are made of many cubess)
    translate(0, 250, 0);//gives block it's y-coordinate
    fill(blockColors[0], blockColors[1], blockColors[2]);
    for (int i = 0; i < 700; i+=5) {//new block color for new block
      if ((i < max && i > min)) {//creates block of certain length by lining up many cubes
        translate(i, 0);//move block across the page
        box(30);
        translate(-i, 0);//prevent translation from carrying over
      }
    }
    //increase speed of block
    max+=blockSpeed;
    min+=blockSpeed;

    if (circleY < 230) {//checks if circle missed and resets bullet if it has
      shot = false;
      circleY = 422;
      radius = 0;
    }
    if ((circleY < 250 && circleX >= min-20 && circleX <= max+20)) {//checks if circle has hit block and makes a new block and resets bullet if it has
      max = 50;
      min = max - (int)(Math.random()*40)-20;
      shot = false;
      circleY = 422;
      radius = 0;
      blockSpeed+=0.5;//speeds up block as you get further in the game
      for(int i = 0; i < blockColors.length; i++)
      blockColors[i] = (int)(Math.random() * 250 + 1);//produce a random color for every new block
    }
    gameScore.update();//update the score
  }
}

//lets the player know that they have lost as well as telling them their score and how to restart the game
public void endGame() {
  endFont = createFont("stormfaze.ttf", 32);
  textFont(endFont, 32);       
  fill(0, 0, 0);
  text("THE BLOCK GOT AWAY!!", 350, 135);
  text("Your score is : " + gameScore.getScore(), 350, 195);
  text("Press the \"R\" key to restart", 350, 285);
  bgSong.close();
}

//resets variables for a new game
public void restartGame() {
  gameScore.resetScore();
  runner.resetRunnerPos();
  max = 50;
  min = 0;
  bgSong = minim.loadFile("bg.mp3", 2048);
  bgSong.play();
  blockSpeed = Math.random()*0.5 + 1;
}

