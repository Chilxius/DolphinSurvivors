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
  int exp = 0;
  boolean levelUpTime;
  float speed = 5;
  int powerBonus = 0; //extra weapon damage
  int defenseBonus = 0; //damage reduction
  int cooldownBonus = 0; //tick reduction for attacks
  
  
  Direction direction = Direction.SOUTH;
  boolean upInput, downInput, leftInput, rightInput;
  
  Player()
  {
    xPos = width/2;
    yPos = height/2;
    
    acceleration = 0.1;
    layer = 3;
    
    //Add Upgrades (Red, Yellow, Blue exist for testing)
    upgrades = new ArrayList<Upgrade>();
    upgrades.add( new HealthIncrease() );
    upgrades.add( new SpeedIncrease() );
    upgrades.add( new Bubble1() );
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

    for (int i = 0; i < upgrades.size(); i++) {  //loops through every upgrade and  uses it
      upgrades.get(i).use(manager.data);
    }
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
  
  @Override
  void collideWithPickup(Pickup p)
  {
    exp++;
    if( exp >= 100 )
    {
      exp = 0;
      levelUpTime = true;
    }
  }
}
