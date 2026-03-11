//Dolphin Survivors

//States:
  //Menu
  //Playing
  //Level up
  //Settings
  //Pause
  //Game Over
  //Credits
  
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
  size(1600,900);
  manager.data.loadImages();
  manager.data.loadSounds(this);
}

void draw()
{
  manager.update();
  manager.display();
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
