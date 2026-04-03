class Pickup extends GameElement
{
  Pickup(Enemy e)
  { 
    xPos = e.xPos;
    yPos = e.yPos;
    
    xSpd = 1;
    ySpd = 1;
    
    layer = 4; 
    
  }
  
  
  
  @Override
  void collide(GameElement other) { other.collideWithPickup(this); }
  //update, draw; isenemy boolean, collide
  
  
  void update() 
  {
    xPos += xSpd;
    yPos += ySpd;
    
    xSpd *= 0.9;
    ySpd *= 0.9;
  }
  
  void display( GameData data )
  {
    manager.data.showImage("pickup",xPos,yPos);
  }
  
  boolean isEnemy() { return false; }
  
  @Override
  void collideWithPlayer(Player p)
  {
    println("Hit player");
    dead = true;
  }
}
