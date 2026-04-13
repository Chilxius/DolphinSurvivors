// ** Wednesday ***
// Have pickups move toward the player
// Have their acceleration be a function of the distance between the pickup and the player (the way Gravity works irl)
// You can look up how that math works, or use processing's dist() formula
// At a certain distance, the speed should be practically nothing

class Pickup extends GameElement
{
  Pickup(Enemy e)
  { 
    xPos = e.xPos;
    yPos = e.yPos;
    
    xSpd = random(-1,1);
    ySpd = random(-1,1);
    
    layer = 4; 
    
    
  }
  
  
  
  @Override
  void collide(GameElement other) { other.collideWithPickup(this); }
  //update, draw; isenemy boolean, collide
  
  
  void update() 
  {
    float playerX = manager.data.player.xPos;
    float playerY = manager.data.player.yPos;
    float distance = manager.data.distanceFromPlayer(this);
    
    xPos += xSpd;
    yPos += ySpd;
    
    xSpd *= 0.9;
    ySpd *= 0.9;
    
    float speed;
    
    while (distance <= 250)
    {
      if (distance <= 2) speed = 1000; else speed = 5;
      if ( playerX >= xPos ) xSpd += speed;  //player is right of pickup
      if ( playerX <  xPos ) xSpd -= speed;  //player is left of pickup
      if ( playerY >= yPos ) ySpd += speed;  //player is above pickup
      if ( playerY <  yPos ) ySpd -= speed;  //player is below pickup
      break;
      
    }
  }
  
  void display( GameData data )
  {
    manager.data.showImage("pickup",xPos,yPos);
  }
  
  boolean isEnemy() { return false; }
  
  @Override
  void collideWithPlayer(Player p)
  {
    dead = true;
  }
}
