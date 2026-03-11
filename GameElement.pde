abstract class GameElement
{
  float xPos, yPos;
  float xSpd, ySpd;
  
  boolean dead; //needs to be removed
  
  abstract void update();
  abstract void display( GameData data );
  abstract boolean isEnemy();
}

class Player extends GameElement
{ 
  ArrayList<Upgrade> upgrades;
  
  int maxHealth = 50;
  int health = maxHealth;
  float speed = 5;
  int powerBonus = 0;
  
  Player()
  {
    xPos = 200;
    yPos = 200;
    
    //Add Upgrades
    upgrades = new ArrayList<Upgrade>();
    upgrades.add( new HealthIncrease() );
    upgrades.add( new Fireball0() );
  }
  
  void update()
  {
    
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
  void heal( int amount )
  {
    health += amount;
    if(health > maxHealth)
      health = maxHealth;
  }
}

class Fireball extends GameElement
{
  Fireball( GameData data, int level )
  {
    
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
    
  }
  
  void update()
  {
    
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
