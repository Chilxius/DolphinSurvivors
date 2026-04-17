//Example of linear upgrade
//Level 0 is a placeholder
class Torpedo0 implements Upgrade
{
  void use( GameData data )
  {
    //does nothing at level 0
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Torpedo1();
  }
  
  String getIconName()
  {
    return "trident";
  }
  
  String getName()
  {
    return "Trident Lvl 1";
  }
  
  String getDescription()
  {
    return "Throws a trident in the direction the player is facing.";
  }
}

//Level 1 adds a projectile to the game
class Torpedo1 implements Upgrade
{
  int cooldown = 30;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Torpedo(data,1) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Torpedo2();
  }
  
  String getIconName()
  {
    return "trident";
  }
  
  String getName()
  {
    return "Bubble Lvl 2";
  }
  
  String getDescription()
  {
    return "Improves the power of your bubbles.";
  }
}

//Level 2 adds better projectiles more often, and upgrades into itself
class Torpedo2 implements Upgrade
{
  int cooldown = 25;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Torpedo(data,2) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Torpedo3();
  }
  
  String getIconName()
  {
    return "trident";
  }
  
  String getName()
  {
    return "Bubbly Spirit";
  }
  
  String getDescription()
  {
    return "Increases the power of your attacks.";
  }
}

//Level 3 adds better projectiles more often, and upgrades into itself
class Torpedo3 implements Upgrade
{
  int cooldown = 20;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Torpedo(data,3) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Torpedo4();
  }
  
  String getIconName()
  {
    return "trident";
  }
  
  String getName()
  {
    return "Bubbly RAGE";
  }
  
  String getDescription()
  {
    return "MORE BUBBLES!!";
  }
}
//Level 4 adds better projectiles more often, and upgrades into itself
class Torpedo4 implements Upgrade
{
  int cooldown = 18;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Torpedo(data,4) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Torpedo5();
  }
  
  String getIconName()
  {
    return "trident";
  }
  
  String getName()
  {
    return "MORE BUBBLES";
  }
  
  String getDescription()
  {
    return "A LOT MORE BUBBLES";
  }
}

//Level 5 adds better projectiles more often, and upgrades into itself
class Torpedo5 implements Upgrade
{
  int cooldown = 15;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Torpedo(data,5) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    data.player.powerBonus++;
    return this;
  }
  
  String getIconName()
  {
    return "trident";
  }
  
  String getName()
  {
    return "TOO MANY TRIDENTS";
  }
  
  String getDescription()
  {
    return "THE BLOOD OF YOUR ENEMIES WILL RUN THROUGH YOUR BUBBLES.\nGET THEM.";
  }
}
