public class Runner {
  private int runnerXPos;

  public Runner() {
    runnerXPos = 0;
  }

  public void increaseXPos() {
      runnerXPos+=10;
  }

  public void decreaseXPos() {
      runnerXPos-=10;
  }
  
  public int getXPos() {
    return runnerXPos;
  }
}

