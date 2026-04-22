// Chris K - Pickups that randomly spawn and move based on projectiles killing host enemy

// For Ritchie: Everything works good now. Whoever operating Player class should 
//              adjust what happens when either type of pickup is picked up in
//              the respective pickup collision override.

class Pickup extends GameElement
{
  @Override //overrides parent abstract class
  void collide(GameElement other) { other.collideWithPickup(this); }
  
  public String pickupType;
  
  Pickup(Enemy e)
  { 
    xPos = e.xPos;
    yPos = e.yPos;
    
    xSpd = ( e.killingProjectileVelocity[0] + random(-5,5) );
    ySpd = ( e.killingProjectileVelocity[1] + random(-5,5) );
    
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
    
    while (distance <= 150)
    {
      //if (distance <= 2) speed = 20; else speed = 1;
      speed = (150-distance)/150.0;
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
      manager.data.showImage("xp-orb",xPos,yPos);
  }
  
  boolean isEnemy() { return false; }
  
  @Override
  void collideWithPlayer(Player p)
  {
    dead = true;
    manager.data.pickupsCollected++;
  }
  
  // Lyndon added this
  @Override
  ArrayList<GameElement> onDeath()
  {
    ArrayList<GameElement> spawned = new ArrayList<GameElement>();
    spawned.add(new DecorationBubble(this)); // Spawns a bubble when the pickup is picked up
    return spawned;
  }
}
