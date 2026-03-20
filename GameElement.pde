abstract class GameElement
{
  float xPos, yPos;
  float xSpd, ySpd;
  float size;
  
  boolean dead; //element needs to be removed
  
  abstract void update();
  abstract void display( GameData data );
  abstract boolean isEnemy();
}

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
  
  Direction direction = Direction.SOUTH;
  
  Player()
  {
    xPos = 200;
    yPos = 200;
    
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
}

class Fireball extends GameElement
{
  float speed;
  
  Fireball( GameData data, int level )
  {
    //originate at player
    //choose random enemy
    //move toward taht enemey
  }
  
  void update()
  {
    
  }
  
  void display( GameData data )
  {
    data.showImage("fire",xPos,yPos);
  }
  
  boolean isEnemy()
  {
    return false;
  }
}

class Enemy extends GameElement
{
  Enemy( GameData data )
  {
    //determine random starting point
    size = 50;
  }
  
  void update()
  {
    //move toward player
  }
  
  void display( GameData data )
  {
    data.showImage("bad",xPos,yPos);
  }
  
  boolean isEnemy()
  {
    return true;
  }
}
