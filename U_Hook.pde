//Example of linear upgrade
//Level 0 is a placeholder
class Hook0 implements Upgrade
{
  void use( GameData data )
  {
    //does nothing at level 0
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Hook1();
  }
  
  String getIconName()
  {
    return "hook";
  }
  
  String getName()
  {
    return "Fishing Hook";
  }
  
  String getDescription()
  {
    return "Casts a seeking hook at the nearest enemy.";
  }
}

//Level 1 adds a projectile to the game
class Hook1 implements Upgrade
{
  int cooldown = 30;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Hook(data,1) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Hook2();
  }
  
  String getIconName()
  {
    return "hook";
  }
  
  String getName()
  {
    return "Fishing Hook";
  }
  
  String getDescription()
  {
    return "Casts a seeking hook at the nearest enemy.";
  }
}

//Level 2 adds better projectiles more often, and upgrades into itself
class Hook2 implements Upgrade
{
  int cooldown = 25;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Hook(data,2) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Hook3();
  }
  
  String getIconName()
  {
    return "hook";
  }
  
  String getName()
  {
    return "Lightweight Hook";
  }
  
  String getDescription()
  {
    return "Makes your hook shoot faster.";
  }
}

//Level 3 adds better projectiles more often, and upgrades into itself
class Hook3 implements Upgrade
{
  int cooldown = 20;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Hook(data,3) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Hook4();
  }
  
  String getIconName()
  {
    return "hook";
  }
  
  String getName()
  {
    return "Hook Launcher";
  }
  
  String getDescription()
  {
    return "Even more hooks!";
  }
}
//Level 4 adds better projectiles more often, and upgrades into itself
class Hook4 implements Upgrade
{
  int cooldown = 18;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Hook(data,4) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Hook5();
  }
  
  String getIconName()
  {
    return "hook";
  }
  
  String getName()
  {
    return "EXTREME Hook";
  }
  
  String getDescription()
  {
    return "Makes you shoot hooks at an EXTREME rate.";
  }
}

//Level 5 adds better projectiles more often, and upgrades into itself
class Hook5 implements Upgrade
{
  int cooldown = 15;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Hook(data,5) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    data.player.powerBonus++;
    return this;
  }
  
  String getIconName()
  {
    return "hook";
  }
  
  String getName()
  {
    return "ULTRAHOOK";
  }
  
  String getDescription()
  {
    return "And so let loose the hooks of war...";
  }
}
