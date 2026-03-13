//Dolphin Survivors

//States:
  //Menu          Sean
  //Playing    *  Moses, Peter
  //Level up   *  Cassie, Bobby
  //Settings   *  for(Student s: class) if( name.equals("Chris") ) assign(s);
  //Pause         Lyndon
  //Game Over     Story
  //Credits       Aiden
  
//Game Elements
  //Player
  //Enemies
  //Walls
  //Missiles
  //Pickups
  
//Other Objects
  //Game Data
  //Upgrade
    //Weapons
    //Stat Increase


import processing.sound.*;

StateManager manager = new StateManager();
    
void setup()
{
  //size(1600,900);
  fullScreen();
  textFont( createFont("Shantell_Sans-Bouncy_Regular.otf",32) );
  manager.data.loadImages();
  manager.data.loadSounds(this);
}

void draw()
{
  manager.update();
  manager.display();
  
  //GRAPHICS TEST
  image( manager.data.images.get("test"), 100, 100 );
}

void keyPressed()
{
  manager.keyReact(true);
}

void keyReleased()
{
  manager.keyReact(false);
}

void mousePressed()
{
  manager.clickReact(true);
}

void mouseReleased()
{
  manager.clickReact(false);
}
