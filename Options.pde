public class Options
{
  int ticker = 260;
  
  void setTempo(){
    
    fill(0);
    stroke(0);
    textAlign(LEFT);
    textFont(optionTextFont);
    text("Tempo", 80, 220);
    
    tempo = ceil((float)100/3+(float)ticker/3);
    text(tempo + " BPM", 460, 265);
    
    fill(colorOptionTextTrue);
    stroke(colorOptionTextTrue);
    rectMode(CENTER);
    rect(260, 255, 360, 5);
    
    if(overTicker()){
      fill(colorOptionTextFalse);
      stroke(colorOptionTextFalse);
    }
    rect(ticker, 255, 10, 30);
    
  }
  
  
  boolean overTicker()
  {
    if(mouseX >= 260-180 && mouseX <= 260+180 && mouseY >= 255-15 && mouseY <= 255+15){
      return true;
    }
    else{
      return false;
    }
  }
  
  void setTicker()
  {
    if(mouseX >= 260-180 && mouseY <= 260+180){
      ticker = mouseX;
    }
  }
  
  
  
}