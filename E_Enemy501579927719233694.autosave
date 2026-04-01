class Enemy extends GameElement
{
  Enemy( GameData data )
  {
    //determine random starting point
    xPos = random(width);
    yPos = random(height);
    size = 50;
    layer = 3;
  }
  
  void update()
  {
    //move toward player
  }
  
  void display( GameData data )
  {
    data.showImage("bad",xPos,yPos);
    //FOR TESTING
    circle(xPos,yPos,25);
  }
  
  boolean isEnemy()
  {
    return true;
  }
  
  @Override
  void collide(GameElement other)
  {
      other.collideWithEnemy(this);
  }
}
