//Dolphin Survivors
  
//One "tick" is 100 milliseconds
  
  
//Stage 2:
  //Player needs to move in StatePlay
  //Upgrade chains created with details
  //StateCredits prepped for animation
  //StateGameOver message fade-in
  //StateLevelUp chooses from Player's upgrades, and the upgrade changes
  //StatePlay measures time in ticks
  //StateSettings has options for volume control, game speed, and font

import processing.sound.*;

StateManager manager;
    
void setup()
{
  frameRate(60); 
  fullScreen();
  
  manager = new StateManager(this);
  //manager.data.loadImages();
  //manager.data.loadSounds(this);
  
  //FOR TESTING PROJECTILES
  Enemy [] testEnemies = new Enemy[4];
  for( int i = 0; i < testEnemies.length; i++ )
  {
    testEnemies[i] = new Enemy(manager.data);
    manager.data.elements.add(testEnemies[i]); 
  }
  
  manager.data.elements.add( new Pickup( testEnemies[0] ) );
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
