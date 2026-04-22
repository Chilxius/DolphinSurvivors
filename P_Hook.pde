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
    
  }
  
  //copied from E Enemy
  //void pointTowardsEnemy()
  //{
   
  //  float angle = atan2(yPos - enemy.yPos, xPos - enemy.xPos);
  //  float angleFlip = atan2(enemy.yPos - yPos, enemy.xPos - xPos);
  //  if(xPos >= enemy.xPos)
  //  {
  //  push();
  //    translate(xPos,yPos);
  //    rotate(angle);
  //    imageMode(CENTER);
  //  pop();
  //  }
  //  else if(xPos < enemy.xPos)
  //  {
  //  push();
  //    translate(xPos,yPos);
  //    rotate(angleFlip);
  //    imageMode(CENTER);
  //  pop();
  //  }
  //}

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
      dead = true;
    }
  }

  void update()
  {
    xPos += xSpd;
    yPos += ySpd;
    if(enemy == null) 
    {
    enemy = manager.data.getRandomEnemy();
    }
    moveTowardsEnemy();
    
    
    
    if( xPos < -50 || xPos > width+50 || yPos < -50 || yPos > height+50 )
      dead = true;
  }

  void display( GameData data )
  {
    
    //pointTowardsEnemy();
    push();
    translate(xPos,yPos);
    rotate(getDirectionAngle());
    manager.data.showImage("hook", 0, 0, 30);
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
