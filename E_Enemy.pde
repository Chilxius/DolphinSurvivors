class Enemy extends GameElement
{
  
  boolean spawned = false;
  Enemy [] testEnemies = new Enemy[4];
  boolean spawnNew = false;
  float health = 100;
  
  Enemy( GameData data )
  {
    //spawns on the edge
    spawnEdge();
    xSpd = 4 + manager.data.difficultyLevel;
    ySpd = 4 + manager.data.difficultyLevel;
    acceleration = 0.8 + manager.data.difficultyLevel*0.2; //Gets faster scaling with difficulty
    size = 50;
    layer = 3;
    if(spawned == false)
    {
      spawnEdge(); //Makes sure the enemy actually spawns (temp fix)
    }
  }
  
  void update()
  {
    if(spawned == true)
    {
      moveTowardsPlayer();
      xPos += xSpd;
      yPos += ySpd;
    
      xSpd = xSpd * 0.93;
      ySpd = ySpd * 0.93;
      
      spawn();
      
    }
  }
  
  void display( GameData data )
  {
    //data.showImage("enemy",xPos,yPos);
    pointTowardsPlayer();
    push();
    
      // Health bar background (red)
      fill(0);
      rect(xPos - 25, yPos - 40, 50, 8);
    
      // Health bar fill (green, shrinks as health drops)
      fill(0, 0, 255);
      rect(xPos - 25, yPos - 40, 50 * (health / 100), 8);
    pop();
  }
  
  void spawn()
  {
    if(dead == true){ //needs to work on millies
      
      testEnemies[0] = new Enemy(manager.data);
      manager.data.elements.add(testEnemies[0]); 
  
      dead = false;
      
    }
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
   
    float angle = atan2(yPos - manager.data.player.yPos, xPos - manager.data.player.xPos);
    
    push();
      translate(xPos,yPos);
      rotate(angle);
      imageMode(CENTER);
      manager.data.showImage("enemy",0,0);
    pop();
    
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
  void collideWithProjectile( Projectile p )
  {
    health = health - 50;
    if(health <= 0)
    {
      dead = true;
      testEnemies[0] = new Enemy(manager.data);
      manager.data.elements.add(testEnemies[0]); 
    }
  
  }
  
  @Override
  void collideWithEnemy( Enemy e)
  {
    if( e.xPos < xPos ) xSpd+=1;
    else                xSpd-=1;
    if( e.yPos < yPos ) ySpd+=1;
    else                ySpd-=1;
  }
  
  @Override
  ArrayList<GameElement> onDeath()
  {
    ArrayList<GameElement> spawned = new ArrayList<GameElement>();
    spawned.add( new Pickup(this) );
    spawned.add( new Pickup(this) );
    spawned.add( new Pickup(this) );
    return spawned;
  }
}
