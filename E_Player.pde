//##########################
//Bobby- Player collides with wall
//Player needs to:
  //Respond to key presses
  //Move
  //Bounce off screen borders
  //Sean - Player takes damage

class Player extends GameElement
{ 
  ArrayList<Upgrade> upgrades;
  
  int maxHealth = 50;
  int health = maxHealth;
  int exp = 0;
  int nextLevel = 20;
  boolean levelUpTime;
  float speed = 5;
  int powerBonus = 0; //extra weapon damage
  int defenseBonus = 0; //damage reduction
  int cooldownBonus = 0; //tick reduction for attacks
  
  Direction direction = Direction.SOUTH;
  boolean upInput, downInput, leftInput, rightInput;
  
  //I-frames
  int iTimer=0;
  
  boolean hasNet;
  
  Player()
  {
    xPos = width/2;
    yPos = height/2;
    
    acceleration = 0.1;
    layer = 3;
    
    //Add Upgrades (Red, Yellow, Blue exist for testing)
    upgrades = new ArrayList<Upgrade>();
    upgrades.add( new HealthIncrease() );
    upgrades.add( new SpeedIncrease() );
    upgrades.add( new Bubble0() );
    upgrades.add( new Net0() );
    upgrades.add( new Hook0() );
    upgrades.add( new Torpedo0() );
    upgrades.add( new Fork1() );
  }
  
  void reset()
  {
    xPos = width/2;
    yPos = height/2;
    maxHealth = 50;
    health = maxHealth;
    exp = 0;
    nextLevel = 20;
    speed = 5;
    hasNet = false;
    powerBonus = 0; //extra weapon damage
    defenseBonus = 0; //damage reduction
    cooldownBonus = 0; //tick reduction for attacks
    
    upgrades = new ArrayList<Upgrade>();
    upgrades.add( new HealthIncrease() );
    upgrades.add( new SpeedIncrease() );
    upgrades.add( new Bubble0() );
    upgrades.add( new Net0() );
    upgrades.add( new Torpedo0() );
    upgrades.add( new Fork1() );
    upgrades.add( new Hook0() );
    
  }
  
  void update()
  {
    bounceOffWall();
    //change speed, move, apply friction
    if( upInput ) ySpd -= acceleration;
    if( downInput ) ySpd += acceleration;
    if( leftInput ) xSpd -= acceleration;
    if( rightInput ) xSpd += acceleration;
    
    xPos += xSpd;
    yPos += ySpd;
    
    xSpd *= 0.97;
    ySpd *= 0.97;

    for (int i = 0; i < upgrades.size(); i++) {  //loops through every upgrade and  uses it
      upgrades.get(i).use(manager.data);
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
  
  void display( GameData data )
  {
    if( hasNet )
      data.showImage("net",xPos,yPos);
    data.showImage("player",xPos,yPos);
  }
  
  boolean isEnemy()
  {
    return false;
  }
  
  //Other methods not found in other GameElements
  //Receive commands from keyReact
  void direct( char c, boolean pressed )
  {
    if( c == 'a' ) leftInput  = pressed;
    if( c == 'd' ) rightInput = pressed;
    if( c == 'w' ) upInput    = pressed;
    if( c == 's' ) downInput  = pressed;
    
    
  }
  
  public Direction getDirection()
  {
    if( abs(xSpd) > abs(ySpd) )
      if( xSpd > 0 ) return Direction.EAST;
      else           return Direction.WEST;
    else
      if( ySpd > 0 ) return Direction.SOUTH;
      else           return Direction.NORTH;
  }
  
  //For when state changes
  void stopMoving()
  {
    
      upInput = downInput = leftInput = rightInput = false;
    
  }
  
  void heal( int amount )
  {
    health += amount;
    if(health > maxHealth)
      health = maxHealth;
  }
  
  void hurt( int amount )
  {
    health -= amount;
    if(health < 0)
      health = 0;
  }
  
  @Override
  void collide(GameElement other)
  {
    other.collideWithPlayer(this);
  }
  
  @Override
  void collideWithPickup(Pickup p)
  {
    exp++;
    if( exp >= nextLevel )
    {
      exp = 0;
      levelUpTime = true;
      nextLevel += 20;
    }
    switch (p.pickupType) {
      case "Health": heal(5); break;
      case "Money" : /* add money  */ break;
    }
  }
    @Override
  void collideWithEnemy( Enemy e)
  {
    if(iTimer > millis() ) return;
    
    iTimer = millis()+500;
    
    //if(e.level == 1)
    //{
    //  health = health - 5;
    //}
    //if(e.level == 2)
    //{
    //  health = health - 10;
    //}
    
    hurt( e.level*5 );
    
  }
  
  
    @Override
  void collideWithWall( Wall w )
  {
    xSpd *= -1;
    ySpd *= -1-0.5;
    //int loopCheck = 0;
    //while(dist(xPos,yPos,w.xPos,w.yPos) < size){
      xPos += xSpd;
      yPos -= 1+w.ySpd;
    //  println(loopCheck++);
    //}
  }
}
