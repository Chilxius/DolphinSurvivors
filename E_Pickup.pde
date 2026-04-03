class Pickup extends GameElement
{
  Pickup(Enemy e)
  { 
    xPos = e.xPos;
    yPos = e.yPos;
    layer = 4; 
    
  }
  
  @Override
  void collide(GameElement other) { other.collideWithPickup(this); }
  //update, draw; isenemy boolean, collide
  
  
  void update() 
  {
    // nothing??
  }
  
  void display( GameData data )
  {
    manager.data.showImage("pickup",xPos,yPos);
  }
  
  boolean isEnemy() { return false; }
  
  @Override
  void collideWithPlayer(Player p) { dead = true; }
}
