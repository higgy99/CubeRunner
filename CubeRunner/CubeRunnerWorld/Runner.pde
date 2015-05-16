public class Runner {
  private int runnerXPos;

  public Runner() {
    runnerXPos = 0;
  }

  public void increaseXPos() {
    runnerXPos+=2;
  }

  public void decreaseXPos() {
    runnerXPos-=2;
  }

  public void setZero() {
    runnerXPos = 0;
  }

  public int getXPos() {
    return runnerXPos;
  }
}

