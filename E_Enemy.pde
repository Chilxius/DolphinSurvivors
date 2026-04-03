class Enemy extends GameElement
{
  
  boolean spawned = false;
  
  Enemy( GameData data )
  {
    //determine random starting point
    xPos = random(width);
    yPos = random(height);
    acceleration = 4 + manager.data.difficultyLevel; //Gets faster scaling with difficulty
    size = 50;
    layer = 3;
  }
  
  void update()
  {
    if(spawned == true)
    {
      moveTowardsPlayer();
    }
    else if(spawned == false)
    {
      spawnEdge();
    }
  }
  
  void display( GameData data )
  {
    data.showImage("enemy",xPos,yPos);
  }
  
  void spawn()
  {
    //if(millis(
  }
  
  
  void spawnEdge()
  {
    int spawnSide = (int)random(4);
    if(spawnSide == 1) //Bottem
    {
      xPos = random(width);
      yPos = height;
      spawned = true;
    }
    if(spawnSide == 2) //Top
    {
      xPos = random(width);
      yPos = 0;
      spawned = true;
    }
    if(spawnSide == 3) //Left
    {
      xPos = 0;
      yPos = random(height);
      spawned = true;
    }
    if(spawnSide == 4) //Right
    {
      xPos = width;
      yPos = random(height);
      spawned = true;
    }
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
