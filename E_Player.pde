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
  
  Player()
  {
    xPos = width/2;
    yPos = height/2;
    
    //Add Upgrades (Red, Yellow, Blue exist for testing)
    upgrades = new ArrayList<Upgrade>();
    upgrades.add( new RedUpgrade() );
    upgrades.add( new BlueUpgrade() );
    upgrades.add( new YellowUpgrade() );
  }
  
  void update()
  {
    //change speed, move, apply friction
  }
  
  void display( GameData data )
  {
    data.showImage("test",xPos,yPos);
  }
  
  boolean isEnemy()
  {
    return false;
  }
  
  //Other methods not found in other GameElements
  //Receive commands from keyReact
  void direct( char c, boolean pressed )
  {

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
  
  @Override
  void collide(GameElement other)
  {
      other.collideWithPlayer(this);
  }
}
