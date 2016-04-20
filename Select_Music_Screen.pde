class Select_Music_Screen 
{
  
  PImage first;
  String[][] songInfo = {
                   {"Twinkle, Twinkle, Little Star", "W.A. Mozart", "TwinkleTwinkle"},
                    {"Honeybee", "Bohemian Folk Song", "Honeybee"},
                    {"Lightly Row", "Traditional Folk Song", "LightlyRow"},
                    {"Go Tell Aunt Rhody", "American Folk Song", "AuntRhody"},
                    {"Minuet in G Major", "J.S. Bach", "MinuetInG"},
                    {"Prelude, Cello Suite No.3 in C major, BWV 1009", "J.S. Bach", "BachCelloSuite3"},
                    /*{"C Test", "Clement Ekaputra", "CTest"},
                    {"Open String Test", "Clement Ekaputra", "openTest"},
                    {"F Test", "Clement Ekaputra", "FTest"},
                    {"Sixteenth Note Test", "Emma Chen", "16test"},*/
                    {"Scale Test", "PracticePal", "ScaleTest"},
                    {"Note Test", "PracticePal", "NoteTest"},
                    {"Demo", "PracticePal", "Demo"}
                 };
  int rectPos; //which song cursor is over
  
  void setup(){
    size(1600,900);
  }
  
  void draw()
  {
    textAlign(LEFT);
    textFont(optionHeadFont);
    text("Select Song", 80, 125);
    
    rectMode(CENTER);
    fill(lines);
    strokeWeight(1);
    stroke(lines);
    rect(screenSizeX/2, 145, screenSizeX-100, 5);
    
    int j = 0;
    for(j = 0; j <= songInfo.length; j++){
      strokeWeight(1);
      fill(lines+20, 128);
      stroke(lines+20, 128);
      rect(screenSizeX/2, 235+60*j, screenSizeX, 5);
    }
    
    mouseOver();
    stroke(lines);
    fill(lines);
    strokeWeight(5);
    line(screenSizeX*4/7, 235, screenSizeX*4/7, 235+60*(j-1));
    
    textSize(32);
    stroke(0);
    fill(0);
    text("Song Name", 100, 215); 
    text("Composer", 1000, 215);
   
   
     for(int i = 0; i < songInfo.length; i++){
       text(songInfo[i][0], 100, 275+60*i);
       text(songInfo[i][1], 1000, 275+60*i);
     }

    backButton();
  }
 
    
  void mouseOver() { 
   
    rectPos = ((mouseY - 235) / (60));
    
    if(rectPos >= 0 && rectPos <  songInfo.length && mouseY > 235){
      fill(colorOptionTextTrue, 128);
      stroke(colorOptionTextTrue, 128);
      rect(screenSizeX/2, 265+60*(rectPos), screenSizeX, 50);
    }
  }
    
  String[] returnSong()
  {
    stage = 6;
    return songInfo[rectPos];
    

  }
  
  boolean overSong(){
    if(rectPos >= 0 && rectPos < songInfo.length && mouseY > 235){
      return true;
    }
    else
      return false;
  }
  
}