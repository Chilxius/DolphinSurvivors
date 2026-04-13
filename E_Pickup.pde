// Chris K - literally everything
// ** Wednesday ***
// Have pickups move toward the player
// Have their acceleration be a function of the distance between the pickup and the player (the way Gravity works irl)
// You can look up how that math works, or use processing's dist() formula
// At a certain distance, the speed should be practically nothing

// ** Monday ***
// [/] Add a health pickup that occasionally spawns 
// [/] Clean up how pickups are attracted to player 
// [/] Have enemies store the velocity of the projectile that killed them
// [ ] Have their pickups use that velocity when they spawn 
//       (enemies killed by a right-moving missile should spill pickups to the right)

class Pickup extends GameElement
{
  @Override //overrides parent abstract class
  void collide(GameElement other) { other.collideWithPickup(this); }
  
  public String pickupType;
  
  Pickup(Enemy e)
  { 
    xPos = e.xPos;
    yPos = e.yPos;
    
    xSpd = e.killingProjectileVelocity[0];
    ySpd = e.killingProjectileVelocity[1];
    
    layer = 4; 
    
    int i = (int)random(10);
    
    if (i == 5) 
      { pickupType = "Health"; }
    else
      { pickupType = "Money"; }
  }
  
  
  
  
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
      if (distance <= 2) speed = 20; else speed = 1;
      if ( playerX >= xPos ) xSpd += speed;  //player is right of pickup
      if ( playerX <  xPos ) xSpd -= speed;  //player is left of pickup
      if ( playerY >= yPos ) ySpd += speed;  //player is above pickup
      if ( playerY <  yPos ) ySpd -= speed;  //player is below pickup
      break;
      
    }
  }
  
  void display( GameData data )
  {
    if (pickupType == "Health")
      manager.data.showImage("medkit",xPos,yPos);
    else
      manager.data.showImage("coin",xPos,yPos);
  }
  
  boolean isEnemy() { return false; }
  
  @Override
  void collideWithPlayer(Player p)
  {
    dead = true;
  }
}
