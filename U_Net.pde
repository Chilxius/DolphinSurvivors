// Lyndon worked on U Net

//Example of linear upgrade
//Level 0 is a placeholder
class Net0 implements Upgrade
{
  void use( GameData data )
  {
    //does nothing at level 0
  }
  
  Upgrade upgrade( GameData data )
  {
    data.player.hasNet = true;
    return new Net1();
  }
  
  String getIconName()
  {
    return "net";
  }
  
  String getName()
  {
    return "Net Lvl 1";
  }
  
  String getDescription()
  {
    return "Spawns a net shield around the player.";
  }
}

//Level 1 adds a projectile to the game
class Net1 implements Upgrade
{
  int cooldown = 30;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Net(data,1) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Net2();
  }
  
  String getIconName()
  {
    return "net";
  }
  
  String getName()
  {
    return "Net Lvl 2";
  }
  
  String getDescription()
  {
    return "Improves the power of your nets.";
  }
}

//Level 2 adds better projectiles more often, and upgrades into itself
class Net2 implements Upgrade
{
  int cooldown = 25;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Net(data,2) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Net3();
  }
  
  String getIconName()
  {
    return "net";
  }
  
  String getName()
  {
    return "Net Lvl 3";
  }
  
  String getDescription()
  {
    return "Increases the power of your nets.";
  }
}

//Level 3 adds better projectiles more often, and upgrades into itself
class Net3 implements Upgrade
{
  int cooldown = 20;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Net(data,3) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Net4();
  }
  
  String getIconName()
  {
    return "net";
  }
  
  String getName()
  {
    return "Net Lvl 4";
  }
  
  String getDescription()
  {
    return "MORE NETS!!";
  }
}
//Level 4 adds better projectiles more often, and upgrades into itself
class Net4 implements Upgrade
{
  int cooldown = 18;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Net(data,4) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Net5();
  }
  
  String getIconName()
  {
    return "net";
  }
  
  String getName()
  {
    return "Net Lvl 5";
  }
  
  String getDescription()
  {
    return "A LOT MORE NETS";
  }
}

//Level 5 adds better projectiles more often, and upgrades into itself
class Net5 implements Upgrade
{
  int cooldown = 15;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Net(data,5) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    data.player.powerBonus++;
    return this;
  }
  
  String getIconName()
  {
    return "net";
  }
  
  String getName()
  {
    return "Net Lvl 6";
  }
  
  String getDescription()
  {
    return "THE BLOOD OF YOUR ENEMIES WILL RUN THROUGH YOUR NETS.\nGET THEM.";
  }
}
