//------------Net-------------

class Net extends Projectile
{
  Direction direction;
  int timer = 0;
  //float[] movementVars;
  //float movementX;
  //float movementY;
  Enemy enemy;

  Net( GameData data, int level )
  {
    speed = 5+level;
    damage = level*2;

    Player player = manager.data.player;
    direction = player.getDirection();
    xPos = player.xPos;
    yPos = player.yPos;
    
    enemy = data.getRandomCloseEnemy(data.player);
  }

  void moveTowardsEnemy()
  {
    if (enemy != null) {
      //Calculates the distance of the enemy from the trident
      float disX = enemy.xPos - this.xPos;
      float disY = enemy.yPos - this.yPos;
      float distance = sqrt(disX*disX + disY*disY);
      if (distance > 0)
      {
        disX /= distance;
        disY /= distance;
      }
      //Moves the trident towards the enemy
      this.xPos += disX * speed;
      this.yPos += disY * speed;
    } else {
      this.dead = true;
    }
  }

  void update()
  {
    xPos += xSpd;
    yPos += ySpd;
    
    if( xPos < -50 || xPos > width+50 || yPos < -50 || yPos > height+50 )
      dead = true;
      
    timer--;
    if(timer < 0)
      dead = true;
  }

  void display( GameData data )
  {
    //push();
    //translate(xPos,yPos);
    //rotate(getDirectionAngle());
    //manager.data.showImage("net", 0, 0);
    //pop();
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
