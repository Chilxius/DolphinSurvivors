class Enemy extends GameElement
{
  Enemy( GameData data )
  {
    //determine random starting point
    xPos = random(width);
    yPos = random(height);
    acceleration = 5 + manager.data.difficultyLevel; //Gets faster scaling with difficulty
    size = 50;
    layer = 3;
  }
  
  void update()
  {
    moveTowardsPlayer();
  }
  
  void display( GameData data )
  {
    data.showImage("bad",xPos,yPos);
    //FOR TESTING
    circle(xPos,yPos,25);
  }
  
  void moveTowardsPlayer()
  {
    //Calculates the distance of the enemy from the player
    float disX = manager.data.player.xPos - xPos; 
    float disY = manager.data.player.yPos - yPos;
    float distance = sqrt(disX*disX + disY*disY);
    if (distance > 0)
    {
      disX /= distance;
      disY /= distance;
    }
    //Moves the enemy towards the player
    xPos += disX * acceleration;
    yPos += disY * acceleration;
    
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
