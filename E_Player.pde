//##########################
//Player needs to:
  //Respond to key presses
  //Move
  //Bounce off screen borders

class Player extends GameElement
{ 
  ArrayList<Upgrade> upgrades;
  
  int maxHealth = 50;
  int health = maxHealth;
  float speed = 5;
  int powerBonus = 0; //extra weapon damage
  int defenseBonus = 0; //damage reduction
  int cooldownBonus = 0; //tick reduction for attacks
  
  int layer = 3;
  
  Direction direction = Direction.SOUTH;
  boolean upInput, downInput, leftInput, rightInput;
  
  Player()
  {
    xPos = width/2;
    yPos = height/2;
    
    acceleration = 0.5;
    
    //Add Upgrades (Red, Yellow, Blue exist for testing)
    upgrades = new ArrayList<Upgrade>();
    upgrades.add( new RedUpgrade() );
    upgrades.add( new BlueUpgrade() );
    upgrades.add( new YellowUpgrade() );
    upgrades.add( new Bubble0() );
  }
  
  void update()
  {
    //change speed, move, apply friction
    if( upInput ) ySpd -= acceleration;
    if( downInput ) ySpd += acceleration;
    if( leftInput ) xSpd -= acceleration;
    if( rightInput ) xSpd += acceleration;
    
    xPos += xSpd;
    yPos += ySpd;
    
    xSpd *= 0.97;
    ySpd *= 0.97;
  }
  
  void display( GameData data )
  {
    data.showImage("player",xPos,yPos);
  }
  
  boolean isEnemy()
  {
    return false;
  }
  
  //Other methods not found in other GameElements
  //Receive commands from keyReact
  void direct( char c, boolean pressed )
  {
    if( c == 'a' ) leftInput  = pressed;
    if( c == 'd' ) rightInput = pressed;
    if( c == 'w' ) upInput    = pressed;
    if( c == 's' ) downInput  = pressed;
  }
  
  //For when state changes
  void stopMoving()
  {
  }
  
  void heal( int amount )
  {
    health += amount;
    if(health > maxHealth)
      health = maxHealth;
  }
  
  void hurt( int amount )
  {
    health -= amount;
    if(health < 0)
      health = 0;
  }
  
  @Override
  void collide(GameElement other)
  {
    other.collideWithPlayer(this);
  }
}
