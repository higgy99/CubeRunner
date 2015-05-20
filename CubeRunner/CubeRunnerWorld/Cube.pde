public class Cube {

  public Cube(int xPos) {
   display(xPos);
  }

  public void display(int xPos) {
    translate(xPos, 270, 0);
    rotateX(-0.1);
    lights();
    fill((int)((Math.random())*255 + 100), (int)((Math.random())*225 - 100), (0));
    stroke(0,0,0);
    box(27);
}
}

