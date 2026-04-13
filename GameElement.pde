abstract class GameElement
{
  float xPos, yPos;
  float xSpd, ySpd;
  float acceleration;
  float size = 30;
  
  //For collision
  int layer;  // 0 - decoration, 1 - wall, 2 - projectile, 3 - creature, 4 - pickup
  
  boolean dead; // element deleted upon this condition 
  
  abstract void update();
  abstract void display( GameData data );
  abstract boolean isEnemy();
  
  ArrayList<GameElement> onDeath() { return new ArrayList<GameElement>(); };
  
  //Double-dispatch
  abstract public void collide(GameElement e);
  //Specific handlers (do nothing by default)
  void collideWithPlayer(Player p) {}
  void collideWithEnemy(Enemy e) {}
  void collideWithProjectile(Projectile p) {}
  void collideWithWall(Wall w) {}
  void collideWithPickup(Pickup p) {}
}
