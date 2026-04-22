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
    return "torpedo";
  }
  
  String getName()
  {
    return "Torpedo Mk. I";
  }
  
  String getDescription()
  {
    return "A violent and explosive fish-seeking torpedo.";
  }
}

//Level 1 adds a projectile to the game
class Torpedo1 implements Upgrade
{
  int cooldown = 100;
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
    return "torpedo";
  }
  
  String getName()
  {
    return "Torpedo: Sea Strafer(TM)";
  }
  
  String getDescription()
  {
    return "Latest industry breakthrough enhances aquadynamics of the torpedo shell.";
  }
}

//Level 2 adds better projectiles more often, and upgrades into itself
class Torpedo2 implements Upgrade
{
  int cooldown = 90;
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
    return "torpedo";
  }
  
  String getName()
  {
    return "F.I.S.H.T.";
  }
  
  String getDescription()
  {
    return "Firmware Integrated Sea Hunter Torpedo: Torpedo torpedos torpedoer.";
  }
}

//Level 3 adds better projectiles more often, and upgrades into itself
class Torpedo3 implements Upgrade
{
  int cooldown = 70;
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
    return "torpedo";
  }
  
  String getName()
  {
    return "Galactic-Level Torpedo";
  }
  
  String getDescription()
  {
    return "Destroyer of fish.";
  }
}
//Level 4 adds better projectiles more often, and upgrades into itself
class Torpedo4 implements Upgrade
{
  int cooldown = 50;
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
    return "torpedo";
  }
  
  String getName()
  {
    return "a slightly faster torpedo";
  }
  
  String getDescription()
  {
    return "Galactic-Level was almost the limit. Not anymore.";
  }
}

//Level 5 adds better projectiles more often, and upgrades into itself
class Torpedo5 implements Upgrade
{
  int cooldown = 30;
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
    return "torpedo";
  }
  
  String getName()
  {
    return "TORPEDO power";
  }
  
  String getDescription()
  {
    return "YOU WIELD THE UNDENIABLE TORPEDO POWER OVER ALL.";
  }
}
