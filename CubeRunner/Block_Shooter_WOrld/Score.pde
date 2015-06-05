int score=0;
public class Score {
  //adds one to the score
  public void update() {
    score+=1;
  }
  //simple method that returns the score
  public int getScore() {
    return score;
  }
  //method used to reset score after the user decides to restart
  public void resetScore() {
    score = 0;
  }
}

