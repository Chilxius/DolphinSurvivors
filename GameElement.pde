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
  
  float[] movementVars;
  float movementX;
  float movementY;
  
  Fireball( GameData data, int level )
  {
   speed = 2;
   
   movementVars = findDirectionVector();
   xSpd = movementVars[0];
   ySpd = movementVars[1];
  }
  
  float[] findDirectionVector()
  {
    Enemy ranEnemy = manager.data.getRandomEnemy();
    Player player = new Player();
    
    float deltaX = ranEnemy.xPos - player.xPos;// Change of xPos
    float deltaY = ranEnemy.yPos - player.yPos;// Change of yPos
    
    float dist = sqrt(deltaX * deltaX  +  deltaY * deltaY);// Magnitude of resultant
    float dirX = deltaX / dist;// Direction of X
    float dirY = deltaY / dist;// Direction of Y
    
    float movementX = dirX * speed; // Final var X
    float movementY = dirY * speed; // Final var Y
    
    float[] movementVars = {movementX, movementY};
    
    return movementVars;
  }
  
  void update()
  {
    xPos += xSpd;
    yPos += ySpd;
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
