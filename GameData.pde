class GameData
{
  //Settings Data
  HashMap<String,PImage> images = new HashMap<String,PImage>();
  HashMap<String,SoundFile> sounds = new HashMap<String,SoundFile>();
  HashMap<String,PFont> fonts = new HashMap<String,PFont>();
  boolean graphicsOn = true;
  boolean soundsOn = true;
  String font = "Shantell";
  int fontSize = 20;
  
  //Game Data
  ArrayList<GameElement> elements;
  int difficultyLevel = 1; //rising difficulty
  //Game Stats
  int playerLevel = 1;
  int enemiesKilled = 0;
  int pickupsCollected = 0;
  //Sound Data
  float masterVolume = 1;
  float sfxVolume = 0.9;
  float musicVolume = 0.9;
  //Game Speed
  float gameSpeed = 60; //framerate
  
  //Timer data (for periodic events)
  int tickDelay = 500;       //time between ticks
  int nextTick = tickDelay;  //time until next tick
  int tickBoost = 0;         //attack speed bonus (reduces tickDelay)
  
  //Player Data
  Player player = new Player();
  
  GameData()
  {
    //Load and set font
    fonts.put( "Shantell", createFont("Shantell_Sans-Bouncy_Regular.otf",32) );
    fonts.put( "Morph", createFont("Morph.otf",32) );
    fonts.put( "CMU", createFont("cmunobx.ttf",32) );
    fonts.put( "Calibra", createFont("calibra.ttf",32) );
    textFont( fonts.get("Shantell") );
    
    //Add Player
    elements = new ArrayList<GameElement>();
    elements.add( player );
    
    //General Settings
    imageMode(CENTER);
  }
  
  
  //*****************************************************************
  // Methods for handling game data
  //*****************************************************************
  void spawn( GameElement e )
  {
    elements.add( e );
  }
  
  Enemy getRandomEnemy()
  {
    ArrayList<Enemy> enemies = new ArrayList<Enemy>();
    
    for( GameElement e: elements )
      if( e.isEnemy() )
        enemies.add( (Enemy) e );
        
    return enemies.get( int(random(enemies.size())) );
  }
  
  
  //*****************************************************************
  // Methods to initialize the image and sound data
  //*****************************************************************
  void loadImages()
  {
    images.put("test", loadImage("fatRat.png") ); images.get("test").resize(100,0);
    images.put("bad",  loadImage("bandit.png") ); images.get("bad").resize(100,0);
  }
  void loadSounds( PApplet app )
  {
    sounds.put("beep", new SoundFile(app, "beep1.wav") );
  }
  
  //*****************************************************************
  // Shows the image if graphics are on and it exists in the map
  //*****************************************************************
  void showImage(String name, float x, float y)
  {
    if(graphicsOn && images.containsKey(name))
      image(images.get(name),x,y);
    
    else
    {
      fill(pickColor(name));
      circle(x,y,50);
    }
  }
  
  //*****************************************************************
  // Fallback colors for when graphics are off or image wasn't loaded
  //*****************************************************************
  color pickColor(String name)
  {
    switch(name)
    {
      case "test":   return color(0,0,200);
      case "wall":   return color(100);
      case "red":    return color(200,0,0);
      case "blue":   return color(0,0,200);
      case "yellow": return color(250,250,0);
      default: return color(0);
    }
  }
  
  //***************************************************************
  // Plays the sound if sounds are on and it exists in the HashMap
  //***************************************************************
  void playSound(String name)
  {
    if(soundsOn && sounds.containsKey(name))
      sounds.get(name).play(masterVolume * sfxVolume);
  }
  //**********************
  // Sound Level Controls
  //**********************
  void setVolume( String type, float vol ) //set volume
  {
    type = type.toLowerCase();
    if( type.equals("master") )
      masterVolume = vol;
    if( type.equals("sfx") )
      sfxVolume = vol;
    if( type.equals("music") )
      musicVolume = vol;
  }
  void changeVolume( String type, float vol ) //adjust volume
  {
    type = type.toLowerCase();
    if( type == "master" )
    {
      masterVolume += vol;
      masterVolume = max(0.0,masterVolume); //value
      masterVolume = min(1.0,masterVolume); // caps
    }
    if( type == "sfx" )
    {
      sfxVolume += vol;
      sfxVolume = max(0.0,sfxVolume); //value
      sfxVolume = min(1.0,sfxVolume); // caps
    }
    if( type == "music" )
    {
      musicVolume += vol;
      musicVolume = max(0.0,musicVolume); //value
      musicVolume = min(1.0,musicVolume); // caps
    }
  }
  
  //**********************
  // Game Speed Controls
  //**********************
  void setGameSpeed( float speed )
  {
    gameSpeed = max(10,speed);
    frameRate( gameSpeed );
  }
  
  //**********************
  // Font Controls
  //**********************
  void setFont( String newFont )
  {
    if( fonts.containsKey(newFont) )
      textFont( fonts.get(newFont) );
  }
  void setFontDefaults( String newFont, int newSize ) //only for settings
  {
    font = newFont;
    fontSize = newSize;
  }
  void resetFont()
  {
    textFont( fonts.get(font) );
    textSize( fontSize );
    textAlign(CENTER);
  }
}
