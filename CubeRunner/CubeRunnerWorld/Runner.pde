public class Runner {
  private int runnerXPos;

  public Runner() {
    runnerXPos = 0;
  }

  //moves the runnner to the right
  public void increaseXPos() {
      runnerXPos+=20;
  }
  
  //moves the runner to the left
  public void decreaseXPos() {
      runnerXPos-=20;
  }
  
  //returns the runners X position
  public int getXPos() {
    return runnerXPos;
  }
  
  public void resetRunnerPos(){
  runnerXPos = 0;
  }
}

