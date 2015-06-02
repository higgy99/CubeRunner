int score=0;
public class Score {
  public void update() {
    score+=1;
  }

  public int getScore() {
    return score;
  }

  public void resetScore() {
    score = 0;
  }
}

