public class MainMenu
{
  //main menu screen
  void menu()
  {
    imageMode(CORNER);
    background(255);
    strokeWeight(1);
    textAlign(CENTER); //creates PracticePal title
    fill(0);
    stroke(0);
    textFont(titleFont);

    image(logo, 400, 75, 1338*0.9, 466*0.9);
    //text("PracticePal", 925, 400);
    
    rectMode(CENTER);
      
   //creates lines
    for(int i = 0; i < 5; i++){
       fill(lines);
       stroke(lines);
       rect(screenSizeX/2, screenSizeY/2+60*i, screenSizeX, 5);
       
       if(i != 4){
         fill(255);
         stroke(255);
         rect(screenSizeX/2, screenSizeY/2+30+60*i, screenSizeX, 50);
      
       }
    }
    
    menuUpdate(); 
    image(musicNote, -150, screenSizeY/2-400, 800,800); 
      
    textAlign(LEFT);
    fill(colorOptionTextFalse);
    stroke(colorOptionTextFalse);
    textFont(optionFont);
    text("PLAY", 550, 495);
    text("ABOUT", 550, 555);
    text("HIGH SCORES", 550, 615);
    text("OPTIONS", 550, 675);
    
    backButton();
  }
  
  
  void play()
  {
    background(255);
    textAlign(LEFT);
    fill(colorOptionHead);
    stroke(colorOptionHead);
    textFont(optionHeadFont);
    music_select.setup();
    music_select.draw();
    //music_select.display();
    //music_select.mouseOver();
      
    backButton();
  }


  //about screen
  void about()
  {
    //header on about screen
    background(255);
    textAlign(LEFT);
    fill(colorOptionHead);
    stroke(colorOptionHead);
    textFont(optionHeadFont);
    text("About", 80, 125); 
    
    //line under header
    rectMode(CENTER);
    fill(lines);
    strokeWeight(1);
    stroke(lines);
    rect(screenSizeX/2, 145, screenSizeX-100, 5);
    
    //actual text in about screen
    rectMode(LEFT);
    fill(colorOptionText);
    stroke(colorOptionText);
    textFont(optionTextFont);
    String aboutP1 = "PracticePal is a system designed by musicians, for musicians. By creating a gamified practice environment, we aim to provide an entertaining and enriching music practice experience.";
    String[] credits = {"Emma Chen", "Jordan Coscia", "Clement Ekaputra", "Jenn Gingerich", "Andrew Saba", "Emma Stilwell", " ", "ENGR 0716", "The Art of Making"};
    text(aboutP1, 80, 170, screenSizeX - 160, 300);
    
    for(int i = 0; i < credits.length; i++){
      text(credits[i], 80, 550+35*i);
    }
    
    backButton();
  
  }
  
  
  //highscore screen
  void highscores()
  {
    background(255);
    textAlign(LEFT);
    fill(colorOptionHead);
    stroke(colorOptionHead);
    textFont(optionHeadFont);
    text("High Scores: ", 100,100);
    
    //text for scores
    textAlign(RIGHT);
    text("Date: ",1500,100);
    
    backButton();
  }
  
  
  //options screen
  void options()
  {
    //option header
    background(255);
    textAlign(LEFT);
    fill(colorOptionHead);
    stroke(colorOptionHead);
    textFont(optionHeadFont);
    text("Options", 80, 125); 
    
    //line under options
    rectMode(CENTER);
    fill(lines);
    strokeWeight(1);
    stroke(lines);
    rect(screenSizeX/2, 145, screenSizeX-100, 5);
    
    options.setTempo();
    
    backButton();
  }

}