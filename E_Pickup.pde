abstract class Pickup extends GameElement
{
  Pickup(){ layer = 4; }
  
  @Override
  void collide(GameElement other) { other.collideWithPickup(this); }
}
