public class Song
{
  private String[] unparsed; //array containing initial information from text file, unseparated
  private Note[] song; //contains string arrays of size two, contains pitch and duration information from text file
  //private int[][] drawData; //contains note info converted into info to be used to draw notes
  private int[] timeSignature; //number of beats per measure, what kind of note gets a beat
  private int beatLength;
  
  //constructor
  Song (String filename)
  {
    unparsed = loadStrings(filename); //loads data file
    timeSignature = new int[] {Integer.parseInt(unparsed[0]), Integer.parseInt(unparsed[1])};
    beatLength = Integer.parseInt(unparsed[2]);
    song = new Note[unparsed.length-3];  //creates song with data file
    
    for(int i = 0; i < song.length; i++){ 
      song[i] = new Note(split(unparsed[i+3], '\t'), timeSignature[0], timeSignature[1], beatLength); //transfers information from unparsed string array into note object
    }
    
  }
  
  //stores pitch and duration data into each note
  void createSong()
  {
    for(int i = 0; i < song.length; i++){
      song[i].determinePitch();
      song[i].determineLength();
    }
  }
  
  Note[] getSong()
  {
    return song;
    
  }
  
  int getMeasureLength()
  {
    return beatLength * timeSignature[0];
  }
  
  int[] getTimeSignature(){
    return timeSignature;
  }
}