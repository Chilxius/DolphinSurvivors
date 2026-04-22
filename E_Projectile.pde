//*******************************************
// Story Clark did bubble & trident code & bubble & trident images
//*******************************************

// ** Wednesday **
//For projectiles that target enemies, have the game check first to make sure the enemy is not NULL
//If the target is null, have the projectile avoid using that null's data, and have it mark itself as dead

abstract class Projectile extends GameElement
{
  //Fields
  float speed;
  int damage;
  
  Projectile() {
    layer = 2;
  }

  @Override
    void collide(GameElement other) {
    other.collideWithProjectile(this);
  }

  void collideWithEnemy(Enemy e)
  {
    this.dead = true;//poofs projectile
  }

  void collideWithWall(Wall w)
  {
    this.dead = true;//poofs projectile (if it didn't hit enemy I think it can go)
  }

  //public float[] findDirectionVector()
  //{
  //  Enemy ranEnemy = manager.data.getRandomEnemy();
  //  Player player = manager.data.player;

  //  float deltaX = ranEnemy.xPos - player.xPos;// Change of xPos
  //  float deltaY = ranEnemy.yPos - player.yPos;// Change of yPos

  //  float dist = sqrt(deltaX * deltaX  +  deltaY * deltaY);// Magnitude of resultant
  //  float dirX = deltaX / dist;// Direction of X
  //  float dirY = deltaY / dist;// Direction of Y

  //  float movementX = dirX * speed; // Final var X
  //  float movementY = dirY * speed; // Final var Y

  //  float[] movementVars = {movementX, movementY};

  //  return movementVars;
  //}
}





//-----------------------------------------------------Bubble----------------

class Bubble extends Projectile
{

  float[] movementVars;
  float movementX;
  float movementY;
  String bubbleImage;

  //Constructor
  Bubble( GameData data, int level )
  {
    speed = 4*level;
    damage = 3*level;

    movementVars = findDirectionVector();
    xSpd = movementVars[0];
    ySpd = movementVars[1];

    Player player = manager.data.player;
    xPos = player.xPos;
    yPos = player.yPos;
    
    if(random(2) <= 1) {
      bubbleImage = "bubble";
    } else {
      bubbleImage = "bubbleCluster";
    }
  }

  public float[] findDirectionVector()
  {
    Enemy ranEnemy = manager.data.getRandomEnemy();
    Player player = manager.data.player;
    
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
    manager.data.showImage(bubbleImage, xPos, yPos);
  }

  boolean isEnemy()
  {
    return false;
  }
}






//--------------------------------------------------------Trident-------------

class Trident extends Projectile
{
  Direction direction;

  Trident( GameData data, int level )
  {
    speed = 5+level;
    damage = level*2;

    Player player = manager.data.player;
    direction = player.getDirection();
    xPos = player.xPos;
    yPos = player.yPos;
    
    switch( direction )
    {
      case NORTH: ySpd = -speed; break;
      case SOUTH: ySpd =  speed; break;
      case WEST:  xSpd = -speed; break;
      case EAST:  xSpd =  speed; break;
      
      
    }
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
    push();
    translate(xPos,yPos);
    rotate(getDirectionAngle());
    manager.data.showImage("trident", 0, 0);
    pop();
  }
  
  float getDirectionAngle()
  {
    switch(direction)
    {
      case NORTH: return 0;
      case EAST: return HALF_PI;
      case SOUTH: return PI;
      case WEST: return PI*1.5;
    }
    return 0;
  }

  boolean isEnemy()
  {
    return false;
  }  
}
