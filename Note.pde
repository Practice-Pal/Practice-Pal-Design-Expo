class Note
{
  
  private String pitch; //letter form of note passed in
  private int pitchNum; //note converted into a representative int
  
  private int noteValue; //int representatinon of note value. 16 = sixteenth note, 8 = eighth note, etc...
  private int drawLength; //int representation of note length, how far away from next note in pixels note will be
  
  private boolean sharp; //true if the note is sharp
  private boolean flat; //true if the note is flat
  PImage sharpSign = loadImage("sharp.jpg"); //loads sharp image
  PImage flatSign = loadImage("flat.jpg"); //loads flat image
  
  private boolean correct; //true if user plays correct note
  private boolean done; //true if user pressed a key
  private boolean checked; //true if PlayMode has already checked score for this note
  
  int beatLength; //pixel length of a measure
  int beatsPer; //beats per measure
  int beatValue; //value of one beat
  
  color noteColor = color(0);
  color right = color(28, 255, 0);
  color wrong = color(255, 0, 0);
  int fade = 255;
  
  //constructor
  Note(String[] info, int beatsInMeasure, int beatVal, int lengthBeat)
  {
    pitch = info[0];
    noteValue = Integer.parseInt(info[1]);
    beatLength = lengthBeat;
    beatValue = beatVal;
    beatsPer = beatsInMeasure;
  }
  
  
  //turns letter of pitch into int representing position away from middle C (1)
  void determinePitch()
  {
    switch((pitch.toLowerCase().charAt(0))){
      case 'c':
        pitchNum = 0;
        break;
      case 'd':
        pitchNum = 1;
        break;
      case 'e':
        pitchNum = 2;
        break;
      case 'f':
        pitchNum = 3;
        break;
      case 'g':
        pitchNum = 4;
        break;
      case 'a':
        pitchNum = 5;
        break;
      case 'b':
        pitchNum = 6;
        break;
    }
    
    
    if(pitch.charAt(1) == '#'){
      sharp = true;
      pitchNum += 7*((int)pitch.charAt(2)-48-4);
    }
    else if (pitch.charAt(1) == 'b'){
      flat = true;
      pitchNum += 7*((int)pitch.charAt(2)-48-4);
    }
    else{
     pitchNum += 7*((int)pitch.charAt(1)-48-4); 
    }
    
  }
  
  //converts length of note into pixel distance
  void determineLength() 
  {
    drawLength = beatLength * beatValue / noteValue;
  }
  
  //returns int pitchNum
  int getPitchNum()
  {
    //System.out.println(pitchNum);
    return pitchNum;
  }
  
  
  int getLength()
  {
    //System.out.println(drawLength);
    return drawLength;
  }
  
  void drawNote(float xPos, float yPos)
  {
    imageMode(CENTER);
    if(sharp){
      image(sharpSign, xPos-40, yPos, 50, 70);
    }
    else if(flat){
      image(flatSign, xPos-40, yPos-15, 60, 90);
    }
    
    if(done){
      fade -= 5;
      if(correct)
        noteColor = color(right, fade);
      else if(!correct)//if(!correct && done)
        noteColor = color(wrong, fade);
    }
   
    else if(!done)
      noteColor = color(0);
      
    ellipseMode(CENTER);
    switch(noteValue){
      case 1: //whole note
        if(pitch.charAt(0) != 'r'){
          stroke(noteColor);
          strokeWeight(5);
          fill(255);
          ellipseMode(CENTER);
          ellipse(xPos, yPos, 40, 25);
        }
        else{
          stroke(noteColor);
          strokeWeight(7);
          fill(0);
          line(xPos,yPos-12,xPos+150,yPos-12);
          rect(xPos+71,yPos,70,20);
        }
        break;
        
      case 2: //half note
        if(pitch.charAt(0) != 'r'){
          strokeWeight(5);
          stroke(noteColor);
          fill(255);
          ellipseMode(CENTER);
          ellipse(xPos, yPos, 40, 25);
          line(xPos+22.5, yPos, xPos+20, yPos-90);
        }
        else{
          stroke(noteColor);
          strokeWeight(7);
          fill(0);
          line(xPos,yPos-12,xPos+150,yPos-12);
          rect(xPos+71,yPos-25,70,20);
        }
        break;

      case 4: //quarter note
        strokeWeight(5);
        fill(noteColor);
        stroke(noteColor);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 40, 25);
        line(xPos+22.5, yPos, xPos+22.5, yPos-90);
        break;
        
      case 8: //eighth note
        strokeWeight(5);
        fill(noteColor);
        stroke(noteColor);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 40, 25);
        line(xPos+22.5, yPos, xPos+20, yPos-90);
        curve(xPos-50, yPos-50, xPos+22.5, yPos-90, xPos+40, yPos-50, xPos, yPos);
        break;
     
     case 16: //sixteenth note
        strokeWeight(5);
        fill(noteColor);
        stroke(noteColor);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 40, 25);
        line(xPos+22.5, yPos, xPos+20, yPos-90);
        curve(xPos-50, yPos-50, xPos+22.5, yPos-90, xPos+40, yPos-50, xPos, yPos);
        curve(xPos-50, yPos-25, xPos+22.5, yPos-65, xPos+40, yPos-25, xPos, yPos);
        break;
    }
    
    fill(0, fade);
    stroke(0, fade);
    strokeWeight(1);
    if(abs(pitchNum) > 5){
      if(pitchNum > 0){
        for(int i = 6; i <= pitchNum; i += 2){
          rect(xPos, screenSizeY/2-15*i, 50, 2);
        }
      }
      else if(pitchNum < 0){
        for(int i = -6; i >= pitchNum; i -= 2){
          rect(xPos, screenSizeY/2-15*i, 50, 2);
        }
      }
    }
  }
  
  
  //checks if note is correct
  void checkNote(boolean pressed, boolean right, boolean in, boolean past)
  {
    if(in /*&& !done*/){
      if(pressed){
        //done = true;
        if(right){
          correct = true;
        }
        else{
          correct = false;
        }
      }
    }
    
    if(past/* && !correct*/){
      done = true;
    }
    
  }
  
  boolean openString()
  {
    if(pitchNum == 1 || pitchNum == 5 || pitchNum == -3 || pitchNum == -7)  
      return true;
    else
      return false;
  }
  //returns string pitch
  String getPitch()
  {
    return pitch; 
  }
  
  //sets the note to be checked if PlayMode has calculatd score for this note
  void setChecked()
  {
     checked = true; 
  }
  //returns boolean done
  boolean getDone()
  {
    return done; 
  }
  
  
  //returns boolean checked
  boolean getChecked()
  {
    return checked; 
  }
  
  //returns boolean correct
  boolean getCorrect()
  {
    return correct; 
  }
    /*
  //returns int noteValue
  int getNoteValue()
  {
    return noteValue; 
  }
  */
}