//*******************************************
// Story Clark
//*******************************************

// ** Wednesday **
//For projectiles that target enemies, have the game check first to make sure the enemy is not NULL
//If the target is null, have the projectile avoid using that null's data, and have it mark itself as dead

abstract class Projectile extends GameElement
{
  Projectile(){ layer = 2; }
  
  @Override
  void collide(GameElement other) { other.collideWithProjectile(this); }
  
  void collideWithEnemy(Enemy e) 
  {
    //e.dead = true;//ideally poofs enemy
    this.dead = true;//poofs projectile
  }
  
  void collideWithWall(Wall w)  
  {
    this.dead = true;//poofs projectile (if it didn't hit enemy I think it can go)
  }
}

//--------------Bubble----------------

class Bubble extends Projectile
{
  //Fields
  float speed;
  float damage;
  
  float[] movementVars;
  float movementX;
  float movementY;
  
  //Constructor
  Bubble( GameData data, int level )
  {
     speed = 7;
     damage = 3;
     
     movementVars = findDirectionVector();
     xSpd = movementVars[0];
     ySpd = movementVars[1];
     
     Player player = manager.data.player;
     xPos = player.xPos;
     yPos = player.yPos;
   }
    
  float[] findDirectionVector()
  {
     Enemy ranEnemy = manager.data.getRandomEnemy();
     Player player = manager.data.player;
     
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
    data.showImage("bubble",xPos,yPos);
  }
  
  boolean isEnemy()
  {
    return false;
  }
}

  
//------------Trident-------------
  
class Trident extends Projectile
{
  float speed;
  float damage;
  
  float[] movementVars;
  float movementX;
  float movementY;
  Enemy enemy;
  
  Trident( GameData data, int level )
  {
   speed = 7;
   damage = 4;
   
   Player player = manager.data.player;
   enemy = manager.data.getRandomEnemy();
   xPos = player.xPos;
   yPos = player.yPos;
  }
  
  void moveTowardsEnemy()
  {
    if(enemy != null) {
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
    moveTowardsEnemy();
  }
  
  void display( GameData data )
  {
    data.showImage("trident",this.xPos,this.yPos);
  }
  
  boolean isEnemy()
  {
    return false;
  }
}
