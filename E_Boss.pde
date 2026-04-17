/*
Sean - added bosses

Green Fish Boss - Tanky and slow. Spawns green fish enemies on hit
Red Fish Boss - Very tanky and very slow. 
Shark Boss - Big shark, very tanky slightly slow.
*likly reskin of shark enemy* Boss - Big *likely reskin of shark enemy*, very tanky. Can move with dash like attacks


*/
class Boss extends Enemy
{
  int level;
  boolean spawned = false;
  boolean spawnNew = false;

  int health = 100;
  int maxHealth = health;

  float[] killingProjectileVelocity = {0,0}; // for pickup direction/speed
  int bossType =1;

  Boss( GameData data )
  {
    super (data);
    spawnEdge();
    level = bossType;
    setBossStats();
  }
  
  void update()
  {
    if(spawned == true)
    {
      bounceOffWall();
      moveTowardsPlayer();
      xPos += xSpd;
      yPos += ySpd;
    
      xSpd = xSpd * acceleration;
      ySpd = ySpd * acceleration;
      
      if( xPos == 0.0 && yPos == 0.0 )
      {
        xPos+=3;
        yPos+=3;
      }
    }
      //spawn();
  }
  
  void display( GameData data )
  {
    pointTowardsPlayer();
    push();
    
      // Health bar background
      fill(0);
      rect(xPos - 50, yPos - 40, 100, 12);
    
      // Health bar (shrinks as health drops)
      fill(255,0,0);
      rect(xPos - 50, yPos - 40, health / (maxHealth/100), 12);
    pop();
    
  }
  
  
  void setBossStats()
  {
   
    if(level == 1)
    {
      maxHealth = health = 600;
      acceleration = 0.4;
    }
    if(level == 2)
    {
      health = 150;
      maxHealth = health;
      acceleration = 0.7;
    }
    
    if(level == 3)
    {
      health = 50;
      maxHealth = health;
      acceleration = 0.8;
    }
    if(level == 4)
    {
      health = 50;
      maxHealth = health;
      acceleration = 0.9;
    }
    
  }
  
  void displayLevel()
  {
    if(level == 1)
    {
      
      if(xPos >= manager.data.player.xPos)
      {
      manager.data.showImage("Bossenemy",0,0);
      }
      else if(xPos < manager.data.player.xPos)
      {
      manager.data.showImage("BossenemyFlip",0,0);
      }

    }
    if(level == 2)
    {
     
      if(xPos >= manager.data.player.xPos)
      {
      manager.data.showImage("redEnemy",0,0);
      }
      else if(xPos < manager.data.player.xPos)
      {
      manager.data.showImage("redEnemyFlip",0,0);
      }
    }  
    if(level == 3)
    {
     
      if(xPos >= manager.data.player.xPos)
      {
      manager.data.showImage("shark",0,0);
      }
      else if(xPos < manager.data.player.xPos)
      {
      manager.data.showImage("sharkFlip",0,0);
      }
    }
    if(level == 4)
    {
     
      if(xPos >= manager.data.player.xPos)
      {
      manager.data.showImage("shark",0,0);
      }
      else if(xPos < manager.data.player.xPos)
      {
      manager.data.showImage("sharkFlip",0,0);
      }

      
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
  
  void bounceOffWall()
  {
   
    if(yPos >= height)
    {
      ySpd-=1;
    }
    if(yPos <= 0)
    {
      ySpd+=1;
    }
    if(xPos >= width)
    {
      xSpd-=1;
    }
    if(xPos <= 0)
    {
      xSpd+=1;
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
    float angleFlip = atan2(manager.data.player.yPos - yPos, manager.data.player.xPos - xPos);
    if(xPos >= manager.data.player.xPos)
    {
    push();
      translate(xPos,yPos);
      rotate(angle);
      imageMode(CENTER);
      displayLevel();
    pop();
    }
    else if(xPos < manager.data.player.xPos)
    {
    push();
      translate(xPos,yPos);
      rotate(angleFlip);
      imageMode(CENTER);
      displayLevel();
    pop();
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
  void collideWithProjectile( Projectile p )
  {
    health = health - 50 + manager.data.player.powerBonus;
    manager.data.elements.add(new Enemy(this));
    if(health <= 0)
    {
      dead = true;
      killingProjectileVelocity[0] = p.xSpd;
      killingProjectileVelocity[1] = p.ySpd;
      
    }
  
  }
  
    @Override
  void collideWithPlayer( Player p)
  {
    if( xPos < p.xPos ) xSpd-=20;
    else                xSpd+=20;
    if( yPos < p.yPos ) ySpd-=20;
    else                ySpd+=20;
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
    for(int i = 1; i < 5; i++)
    {
      spawned.add( new Pickup(this) );
    }
    spawned.add(new DecorationBubble(this)); // Lyndon added this: Spawns a bubble when an enemie dies
    return spawned;
  }
}
