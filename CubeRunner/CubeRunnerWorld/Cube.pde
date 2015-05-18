public class Cube {

  public Cube() {
    
  }

  public void display(int xPos) {
    translate(xPos, 270, 0);
    rotateX(-0.1);
    lights();
    fill((int)((Math.random())*225), (int)((Math.random())*225), (int)((Math.random())*225));
    box(27);
}
}

