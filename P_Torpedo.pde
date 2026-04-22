//------------Torps-------------

class Torpedo extends Projectile
{
  Direction direction;
  float[] movementVars;
  float movementX;
  float movementY;
  Enemy enemy;

  Torpedo( GameData data, int level )
  {
    speed = 5+level;
    damage = level*2;
    movementVars = findDirectionVector();
    xSpd = movementVars[0];
    ySpd = movementVars[1];

    Player player = manager.data.player;
    xPos = player.xPos;
    yPos = player.yPos;
    
   
  }

   public float[] findDirectionVector()
  {
    Player player = manager.data.player;
    Enemy ranEnemy = manager.data.getRandomEnemy();
    
    if( ranEnemy == null )
    {
      dead = true;
      return new float[] {player.xPos,player.yPos};
    }
    
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
    
    if( xPos < -50 || xPos > width+50 || yPos < -50 || yPos > height+50 )
      dead = true;
  }

  void display( GameData data )
  {
    manager.data.showImage("torpedo", xPos, yPos);
  }

  boolean isEnemy()
  {
    return false;
  }
}
