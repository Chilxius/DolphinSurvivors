abstract class Wall extends GameElement
{
  Wall(){ layer = 1; }
  
  @Override
  void collide(GameElement other) { other.collideWithWall(this); }
}
