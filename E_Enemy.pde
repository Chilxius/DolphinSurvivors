// ** WEDNESDAY **
// Add at least one more image for enemies
// Have the image change based on the game's difficulty level when the enemy spawns
  //Enemies now have a level variable
// Chris K - Made enemies now save velocity of the projectile that killed them

class Enemy extends GameElement
{
  int level;
  boolean spawned = false;
  //Enemy [] testEnemies = new Enemy[4];
  boolean spawnNew = false;
  int health = 100;
  float[] killingProjectileVelocity; // for pickup direction/speed
  
  Enemy( GameData data )
  {
    //spawns on the edge
    spawnEdge();
    size = 50;
    layer = 3;
    if(spawned == false)
    {
      spawnEdge(); //Makes sure the enemy actually spawns (temp fix)
    }
    
    level = data.difficultyLevel;
    
    acceleration = 0.05 + (level*0.02);
    
  }
  
  void update()
  {
    if(spawned == true)
    {
      moveTowardsPlayer();
      xPos += xSpd;
      yPos += ySpd;
    
      xSpd = xSpd * 0.99;
      ySpd = ySpd * 0.99;
    }
      spawn();
  }
  
  void display( GameData data )
  {
    //data.showImage("enemy",xPos,yPos);
    displayLevel();
    pointTowardsPlayer();
    push();
    
      // Health bar background
      fill(0);
      rect(xPos - 25, yPos - 40, 50, 8);
    
      // Health bar (shrinks as health drops)
      fill(0, 0, 255);
      rect(xPos - 25, yPos - 40, health / 2, 8);
    pop();
  }
  
  void setEnemyType()
  {
   
    if(level == 1)
    {
      health = 100;
      acceleration = 0.8;
    }
    if(level == 2)
    {
      health = 150;
      acceleration = 0.8;
    }
    /*
    if(level == 3)
    {
      health = 200;
      acceleration = 0.75;
    }
    if(level == 4)
    {
      health = 100;
      acceleration = 0.9;
    }
    */
  }
  
  void displayLevel()
  {
    if(level == 1)
    {
     
      manager.data.showImage("enemy",0,0);

      
    }
    if(level == 2)
    {
     
      manager.data.showImage("shark",0,0);

      
    }
    
  }
  
  void spawn()
  {
    if(manager.data.enemiesSpawned < manager.data.enemyAmount)
    {
      manager.data.enemiesSpawned++;
      manager.data.elements.add( new Enemy(manager.data) );
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
      displayLevel();
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
      killingProjectileVelocity = p.findDirectionVector();
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
  void collideWithWall( Wall w )
  {
    xSpd *= -1;
    ySpd *= -1;
    //int loopCheck = 0;
    //while(dist(xPos,yPos,w.xPos,w.yPos) < size){
      xPos += xSpd;
      yPos -= 1+w.ySpd;
    //  println(loopCheck++);
    //}
  }
  
  @Override
  ArrayList<GameElement> onDeath()
  {
    manager.data.enemiesSpawned--;
    ArrayList<GameElement> spawned = new ArrayList<GameElement>();
    spawned.add( new Pickup(this) );
    spawned.add( new Pickup(this) );
    spawned.add( new Pickup(this) );
    return spawned;
  }
}
