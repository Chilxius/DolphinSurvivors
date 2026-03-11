class GameData
{
  //Settings Data
  HashMap<String,PImage> images = new HashMap<String,PImage>();
  HashMap<String,SoundFile> sounds = new HashMap<String,SoundFile>();
  boolean graphicsOn = true;
  boolean soundsOn = true;
  
  //Game Data
  ArrayList<GameElement> elements;
  ArrayList<Upgrade> upgrades;
  int level = 1; //rising difficulty
  
  //Player Data
  Player player = new Player();
  
  GameData()
  {
    //Add Player and Walls
    elements = new ArrayList<GameElement>();
    elements.add( player );
    
    //Add Upgrades
    upgrades = new ArrayList<Upgrade>();
    upgrades.add( new HealthIncrease() );
    upgrades.add( new Fireball0() );
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
        enemies.add((Enemy)e);
        
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
      case "test": return color(0,0,200);
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
