public class Runner {
  private int runnerXPos;

  public Runner() {
    runnerXPos = 0;
  }

  public void increaseXPos() {
      runnerXPos+=20;
  }

  public void decreaseXPos() {
      runnerXPos-=20;
  }
  
  public int getXPos() {
    return runnerXPos;
  }
  
  public void resetRunnerPos(){
  runnerXPos = 0;
  }
}

