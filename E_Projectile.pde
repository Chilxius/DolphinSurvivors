abstract class Projectile extends GameElement
{
  Projectile(){ layer = 2; }
  
  @Override
  void collide(GameElement other) { other.collideWithProjectile(this); }
}

class Bubble extends Projectile
{
  float speed;
  
  float[] movementVars;
  float movementX;
  float movementY;
  
  Bubble( GameData data, int level )
  {
   speed = 7;
   
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
    data.showImage("fire",xPos,yPos);
  }
  
  boolean isEnemy()
  {
    return false;
  }
}
