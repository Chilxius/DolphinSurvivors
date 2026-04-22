//------------Hooks-------------

class Hook extends Projectile
{
  Direction direction;
  //float[] movementVars;
  //float movementX;
  //float movementY;
  Enemy enemy;

  Hook( GameData data, int level )
  {
    speed = 5+level;
    damage = level*2;

    Player player = data.player;
    
    direction = player.getDirection();
    xPos = player.xPos;
    yPos = player.yPos;
    enemy = data.getRandomEnemy();
    
    
    //switch( direction )
    //{
    //  case NORTH: ySpd = -speed; break;
    //  case SOUTH: ySpd =  speed; break;
    //  case WEST:  xSpd = -speed; break;
    //  case EAST:  xSpd =  speed; break;
      
      
    //}
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
    
    moveTowardsEnemy();
    
    if( xPos < -50 || xPos > width+50 || yPos < -50 || yPos > height+50 )
      dead = true;
  }

  void display( GameData data )
  {
    push();
    translate(xPos,yPos);
    rotate(getDirectionAngle());
    manager.data.showImage("torpedo", 0, 0);
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
