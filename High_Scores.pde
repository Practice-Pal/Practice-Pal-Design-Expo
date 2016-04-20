class HighScores {
int[] scores = new int[5];
int score;
PImage gradeImage;
PFont songFont = loadFont("SegoeUI-Light-44.vlw");
PFont composerFont = loadFont("SegoeUI-Light-36.vlw");
PFont scoreFont = loadFont("SegoeUI-Light-70.vlw");
PFont scoreNumFont = loadFont("SegoeUI-Light-80.vlw");
int year, month, day, hour, minute;
int xPos = 170;
int yPos = 420;
color green = color(28, 255, 0);
color red = color(255, 0, 0);
color scoreColor = color(200);
color scoreNumColor = color(100);

  void setup() {
    for (int i=0; i<scores.length; i++) {
      scores[i] = 1000;
    }
  }
   
  void draw() {
    text("Scores: ", 50, 60);
    for (int i=0; i<scores.length; i++) {
      text(scores[i], 50, 120+60*i);
    }
  }
   
  void keyPressed() {
    addNewScore(score);
  }
   
  void addNewScore(int score) {
    for (int i=0; i<scores.length; i++) {
      if (score<=scores[i]) {
        for (int j=scores.length-1; j>=max(i,1); j--) {
          scores[j] = scores[j-1];
        }
        scores[i] = score;
        break;
      }
    }
  }
  
  void setDate(){
    year = year() - 2000;
    month = month();
    day = day();
    hour = hour();
    minute = minute();
  }
  
  //end game screen
  void endGame(String songName, String composer, int score, int numCorrect, int numWrong, int maxCombo, float accuracy)
  {
    //image of grade
    imageMode(CENTER);
    setGrade(accuracy);
    image(gradeImage, 1200, 475);
    
    //line under song/composer info
    stroke(lines);
    fill(lines);
    rect(screenSizeX/2, 180, screenSizeX, 5);
    
    //info text
    fill(0);
    textFont(songFont);
    textAlign(LEFT, CENTER);
    text(songName, 75, 55);
    textSize(35);
    text(composer, 75, 100);
    text("Played on " + nf(month,2) + "/" + nf(day,2) + "/" + year + " at " + nf(hour,2) + ":" + nf(minute), 75, 145);
  
    
    //score info
    fill(scoreColor);
    stroke(scoreColor);
    textFont(scoreFont);
    textAlign(RIGHT, CENTER);
    text("Score", 300, 255);
    textAlign(LEFT, CENTER);
    text("Max Combo", 25, 520);
    text("Accuracy", 525, 520);
    
    fill(scoreNumColor);
    stroke(scoreNumColor);
    textFont(scoreNumFont);
    text(nf(score, 8), 335, 255);
    text(maxCombo+ "x", 140, 600);
    text(nf(accuracy, 1, 2) + "%", 535, 600);
    
    //draws green note
    xPos = 170;
    strokeWeight(5);
    fill(green);
    stroke(green);
    ellipseMode(CENTER);
    ellipse(xPos, yPos, 40, 25);
    line(xPos+22.5, yPos, xPos+22.5, yPos-90);
    
    //draws number of right notes
    fill(scoreNumColor);
    stroke(scoreNumColor);
    text(numCorrect + "x", xPos+60, yPos-45);
    
    //draws red note
    xPos = 480;
    strokeWeight(5);
    fill(red);
    stroke(red);
    ellipseMode(CENTER);
    ellipse(xPos, yPos, 40, 25);
    line(xPos+22.5, yPos, xPos+22.5, yPos-90);
    
    //draws number of wrong notes
    fill(scoreNumColor);
    stroke(scoreNumColor);
    text(numWrong + "x", xPos+60, yPos-45);
    
    backButton();
  }
  
  void setGrade(float accuracy)
  {
    if(accuracy >= 90){
      gradeImage = loadImage("A.JPG"); 
    }
    else if(accuracy >= 80){
      gradeImage = loadImage("B.JPG"); 
    }
    else if(accuracy >= 70){
      gradeImage = loadImage("C.JPG"); 
    }
    else{
      gradeImage = loadImage("D.JPG"); 
    }
  }
  
  void enterScores(String filename, int score, int maxCombo, float accuracy)
  {
    File highScoresFile = new File(filename + "Highscores.tsf");
    if(highScoresFile.exists()){
      
    }
  }
}