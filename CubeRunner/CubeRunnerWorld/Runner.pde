public class Runner {
  private int runnerXPos;

  public Runner() {
    runnerXPos = 0;
  }

  public void increaseXPos() {
      runnerXPos++;
  }

  public void decreaseXPos() {
      runnerXPos--;
  }

  public int getXPos() {
    return runnerXPos;
  }
}

