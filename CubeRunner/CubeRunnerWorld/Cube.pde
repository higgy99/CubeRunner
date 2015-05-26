public class Cube {
  public void display() {
    rotateX(-0.1);
    lights();
    fill((int)((Math.random())*255 + 100), (int)((Math.random())*225 - 100), (0));
    stroke((int)((Math.random())*255 + 100), (int)((Math.random())*225 - 100), (0));
  }
}
