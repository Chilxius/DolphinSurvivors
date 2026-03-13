class GameData
{
  //Settings Data
  HashMap<String,PImage> images = new HashMap<String,PImage>();
  HashMap<String,SoundFile> sounds = new HashMap<String,SoundFile>();
  boolean graphicsOn = true;
  boolean soundsOn = true;
  
  //Game Data
  ArrayList<GameElement> elements;
  int difficultyLevel = 1; //rising difficulty
  //Game Stats
  int playerLevel = 1;
  int enemiesKilled = 0;
  int pickupsCollected = 0;
  
  //Timer data (for periodic events)
  int tickDelay = 500;       //time between ticks
  int nextTick = tickDelay;  //time until next tick
  int tickBoost = 0;         //attack speed bonus (reduces tickDelay)
  
  //Player Data
  Player player = new Player();
  
  GameData()
  {
    //Add Player
    elements = new ArrayList<GameElement>();
    elements.add( player );
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
    images.put("test", loadImage("fatRat.png") );
    images.get("test").resize(100,0);
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
      sounds.get(name).play();
  }
}
