class GameData
{
  //Settings Data
  HashMap<String,PImage> images = new HashMap<String,PImage>();
  HashMap<String,SoundFile> sounds = new HashMap<String,SoundFile>();
  HashMap<String,SoundFile> music = new HashMap<String,SoundFile>();
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
  float masterVolume = 0.50;
  float sfxVolume = 0.75;
  float musicVolume = 0.75;
  //Game Speed
  float gameSpeed = 60; //framerate
  
  //Timer data (for periodic events)
  int tickDelay = 500;       //time between ticks
  int nextTick = tickDelay;  //time until next tick
  int tickBoost = 0;         //attack speed bonus (reduces tickDelay)
  
  //Player Data
  Player player = new Player();
  
  GameData( PApplet app )
  {
    loadImages();
    loadSounds(app);
    
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
    
    if( enemies.size() > 0 )
      return enemies.get( int(random(enemies.size())) );
    else
      return null;
  }
  
  Enemy getRandomCloseEnemy( Player p )
  {
    ArrayList<Enemy> enemies = new ArrayList<Enemy>();
    
    for( GameElement e: elements )
      if( e.isEnemy() && dist(e.xPos,e.yPos,p.xPos,p.yPos) < 500 )
        enemies.add( (Enemy) e );
    
    if( enemies.size() > 0 )
      return enemies.get( int(random(enemies.size())) );
    else
      return null;
  }
  
  //*****************************************************************
  // Methods to initialize the image, sound, and music data
  //*****************************************************************
  void loadImages()
  {
    images.put("test",       loadImage("fatRat.png") );      images.get("test").resize(50,0);
    images.put("bad",        loadImage("bandit.png") );      images.get("bad").resize(50,0);
    images.put("enemy",      loadImage("enemy.png") );       images.get("enemy").resize(50,0);
    images.put("player",     loadImage("player.png") );      images.get("player").resize(50,0);
    images.put("twoFish",    loadImage("twoFish.png") );     images.get("twoFish").resize(50,0);
    images.put("pickup",     loadImage("copperPiece.png") ); images.get("pickup").resize(50,0);
    images.put("wall",       loadImage("puff.png") );        images.get("wall").resize(50,0);
    images.put("background", loadImage("deepDarkSea.png") ); images.get("background"); // (1152 x 648)
    images.put("seaMine",    loadImage("evilSeaMine.png") ); images.get("seaMine").resize(100, 0); // (226 x 647)
  }
  void loadSounds( PApplet app )
  {
    //Music
    music.put("Party", new SoundFile(app, "Who Likes to Party.mp3"));
    music.put("Duck", new SoundFile(app, "Fluffing a Duck.mp3"));
    music.put("Gumption", new SoundFile(app, "Jaunty Gumption.mp3"));
    music.put("Snitch", new SoundFile(app, "Sneaky Snitch.mp3"));
    music.put("Basement", new SoundFile(app, "Basement Floor.mp3"));
    music.put("Disfigure", new SoundFile(app, "Disfigure.mp3"));
    music.put("Harinezumi", new SoundFile(app, "Harinezumi.mp3"));
    music.put("Heroes", new SoundFile(app, "Heroes Tonight.mp3"));
    music.put("Ice", new SoundFile(app, "Ice Flow.mp3"));
    music.put("Chicken", new SoundFile(app, "If I Had a Chicken.mp3"));
    music.put("Local", new SoundFile(app, "Local Forecast.mp3"));
    music.put("Quirky", new SoundFile(app, "Quirky Dog.mp3"));
    music.put("High", new SoundFile(app, "Sky High.mp3"));
    music.put("Monkeys", new SoundFile(app, "Monkeys Spinning Monkeys.mp3"));
    
    //SFX
    sounds.put("Upgrade", new SoundFile(app, "UpgradeClick.mp3"));
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
      case "enemy":  return color(200,0,0);
      case "player": return color(0,200,0);
      case "pickup": return color(100,100,200);
      case "decoration": return color(200);
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
    SoundFile s = sounds.get(name);
    if(soundsOn && sounds.containsKey(name))
    {
      s.amp(masterVolume * sfxVolume);
      s.play();
    }
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
