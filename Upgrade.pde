interface Upgrade
{
  void use( GameData data );
  Upgrade upgrade( GameData data );
  String getIconName();
  String getName();
  String getDescription();
}

//Example of cyclical upgrade
class HealthIncrease implements Upgrade
{
  void use( GameData data )
  {
    //no-op
  }
  
  Upgrade upgrade( GameData data )
  {
    data.player.maxHealth += 10;
    data.player.heal(10);
    return this;
  }
  
  String getIconName()
  {
    return "heart";
  }
  
  String getName()
  {
    return "Health Increase";
  }
  
  String getDescription()
  {
    return "Increases your health by 10.";
  }
}

//Example of linear upgrade
//Level 0 is a placeholder
class Fireball0 implements Upgrade
{
  void use( GameData data )
  {
    //does nothing at level 0
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Fireball1();
  }
  
  String getIconName()
  {
    return "fireball";
  }
  
  String getName()
  {
    return "Fireball Lvl 1";
  }
  
  String getDescription()
  {
    return "Launches a ball of fire at a random enemy.";
  }
}

//Level 1 adds a projectile to the game
class Fireball1 implements Upgrade
{
  int cooldown = 5;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Fireball(data,1) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Fireball2();
  }
  
  String getIconName()
  {
    return "fireball";
  }
  
  String getName()
  {
    return "Fireball Lvl 2";
  }
  
  String getDescription()
  {
    return "Improves the power of your fireball.";
  }
}

//Level 2 adds better projectiles more often, and upgrades into itself
class Fireball2 implements Upgrade
{
  int cooldown = 3;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Fireball(data,2) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    data.player.powerBonus++;
    return this;
  }
  
  String getIconName()
  {
    return "fireball";
  }
  
  String getName()
  {
    return "Fiery Spirit";
  }
  
  String getDescription()
  {
    return "Increases the power of your attacks.";
  }
}
