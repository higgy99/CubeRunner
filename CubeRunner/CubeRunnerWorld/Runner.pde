public class Runner {
  private int runnerXPos;

  public Runner() {
    runnerXPos = 0;
  }

  public void increaseXPos() {
      runnerXPos+=5;
  }

  public void decreaseXPos() {
      runnerXPos-=5;
  }
  
  public int getXPos() {
    return runnerXPos;
  }
}

