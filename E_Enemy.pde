class Enemy extends GameElement
{
  
  boolean spawned = false;
  
  Enemy( GameData data )
  {
    //spawns on the edge
    spawnEdge();
    xSpd = 4 + manager.data.difficultyLevel;
    ySpd = 4 + manager.data.difficultyLevel;
    acceleration = 0.5 + manager.data.difficultyLevel*0.1; //Gets faster scaling with difficulty
    size = 50;
    layer = 3;
  }
  
  void update()
  {
    if(spawned == true)
    {
      moveTowardsPlayer();
      xPos += xSpd;
      yPos += ySpd;
    
      xSpd = xSpd * 0.97;
      ySpd = ySpd * 0.97;
    }
    if(spawned == false)
    {
      spawnEdge(); //Makes sure the enemy actually spawns (temp fix)
    }
  }
  
  void display( GameData data )
  {
    data.showImage("enemy",xPos,yPos);
  }
  
  void spawn()
  {
    //spawns enemies on a tick count
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
    xSpd += disX * acceleration;
    ySpd += disY * acceleration;
    
  }
  
  void pointTowardsPlayer()
  {
   
    if(manager.data.player.xPos > xPos){
        
    }
    if(manager.data.player.xPos < xPos){
        //rotates
    }
    
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
  
  @Override
  void collideWithEnemy( Enemy e)
  {
    if( e.xPos < xPos ) xSpd+=1;
    else                xSpd-=1;
    if( e.yPos < yPos ) ySpd+=1;
    else                ySpd-=1;
  }
}
