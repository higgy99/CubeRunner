int[] xPositions = new int[10];//10 cubes on the screen at once
public class Cube {

  public Cube() {
    
  }

  public void createXPositions() {
    for (int i = 0; i < xPositions.length; i++)
      xPositions[i] = (int)((Math.random())*650) + 25;
  }

  public void display() {
    translate(350, 270, 350);
    rotateX(-0.1);
    lights();
    fill((int)((Math.random())*255), (int)((Math.random())*255), (int)((Math.random())*255));
    stroke((int)((Math.random())*255), (int)((Math.random())*255), (int)((Math.random())*255));
    box(8);
  }
}

