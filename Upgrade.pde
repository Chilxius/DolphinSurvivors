interface Upgrade
{
  void use( GameData data );
  Upgrade upgrade( GameData data );
  String getIconName();
  String getName();
  String getDescription();
}

//####################################################

// Lyndon Yang worked on upgrade

// Chris J - bubble skill tree

//Upgrade Lines (5 levels of each if not cyclical):
  //Health improvement (cyclical)
  //Speed improvement (cyclical)
  //Attack speed improvement (after five levels, the cyclical upgrade should be very small)
  //Attack that moves forward (in direction player is facing) (this starts at level 1)
  //Attack that moves toward a random enemy
  //Attack that moves toward the closest enemy
  //Area of effect damage around player every tick
//Make sure each Upgrade has a name and description so Upgrade can work


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
// Speed improvement (cyclical) upgrade
class SpeedIncrease implements Upgrade
{
  void use( GameData data )
  {
    //None yet
  }
  
  Upgrade upgrade( GameData data )
  {
    data.player.speed += 10;
    return this;
  }
  
  String getIconName()
  {
    return "wing Boots";
  }
  
  String getName()
  {
    return "Speed Increase";
  }
  
  String getDescription()
  {
    return "Increases your speed by 10.";
  }
}

//Example of linear upgrade
//Level 0 is a placeholder
class Bubble0 implements Upgrade
{
  void use( GameData data )
  {
    //does nothing at level 0
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Bubble1();
  }
  
  String getIconName()
  {
    return "bubble";
  }
  
  String getName()
  {
    return "Bubble Lvl 1";
  }
  
  String getDescription()
  {
    return "Launches a ball of bubble at a random enemy.";
  }
}

//Level 1 adds a projectile to the game
class Bubble1 implements Upgrade
{
  int cooldown = 20;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Bubble(data,1) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Bubble2();
  }
  
  String getIconName()
  {
    return "bubble";
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
class Bubble2 implements Upgrade
{
  int cooldown = 15;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Bubble(data,2) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Bubble3();
  }
  
  String getIconName()
  {
    return "bubble";
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
class Bubble3 implements Upgrade
{
  int cooldown = 10;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Bubble(data,3) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Bubble4();
  }
  
  String getIconName()
  {
    return "bubble";
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
class Bubble4 implements Upgrade
{
  int cooldown = 5;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Bubble(data,4) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    return new Bubble5();
  }
  
  String getIconName()
  {
    return "bubble";
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
class Bubble5 implements Upgrade
{
  int cooldown = 2;
  int nextShot = cooldown;
  
  void use( GameData data )
  {
    nextShot--;
    if(nextShot <= 0)
    {
      nextShot = cooldown;
      data.spawn( new Bubble(data,5) );
    }
  }
  
  Upgrade upgrade( GameData data )
  {
    data.player.powerBonus++;
    return this;
  }
  
  String getIconName()
  {
    return "bubble";
  }
  
  String getName()
  {
    return "TOO MANY BUBBLES";
  }
  
  String getDescription()
  {
    return "THE BLOOD OF YOUR ENEMIES WILL RUN THROUGH YOUR BUBBLES.\nGET THEM.";
  }
}

public enum Direction
{
  NORTH, NORTH_WEST,
  WEST, SOUTH_WEST,
  SOUTH, SOUTH_EAST,
  EAST, NORTH_EAST
}

////***************** Upgrades for Testing ******************** //Changed by Cassie for proof of testing
//class RedUpgrade implements Upgrade //basically turned into Health Upgrade
//{
//  void use( GameData data ){}
//  Upgrade upgrade( GameData data )
//  {
//    data.player.maxHealth += 10;
//    data.player.heal(10);
//    //debug
//    System.out.println("DEBUG: Current max HP: " + data.player.maxHealth);
//    return this;
//  }
//  String getIconName(){return "red";}
//  String getName(){return "Red Upgrade";}
//  String getDescription(){return "Red red wine, goes to my head.";}
//}
//class BlueUpgrade implements Upgrade //dummy defense upgrade
//{
//  void use( GameData data ){}
//  Upgrade upgrade( GameData data )
//  {
//    data.player.defenseBonus += 1;
//    //debug
//    System.out.println("DEBUG: Current defense bonus: " + data.player.defenseBonus);
    
//    return this;
//  }
//  String getIconName(){return "blue";}
//  String getName(){return "Blue Upgrade";}
//  String getDescription(){return "In the blue house with the blue little windows and a blue corvette.";}
//}
//class YellowUpgrade implements Upgrade //dummy power upgrade
//{
//  void use( GameData data ){}
//  Upgrade upgrade( GameData data )
//   {
//     data.player.powerBonus += 1;
//     //debug
//     System.out.println("DEBUG: Current power bonus: " + data.player.powerBonus);
//     return this;
//   }
//  String getIconName(){return "yellow";}
//  String getName(){return "Yellow Upgrade";}
//  String getDescription(){return "Look at the stars, look how they shine for you, and all the things you do, yeah they were all yellow.";}
//}
