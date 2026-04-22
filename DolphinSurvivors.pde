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

import processing.core.PApplet;
import processing.sound.*;
import java.util.Collections;

StateManager manager;
  
void setup()
{
  frameRate(60); 
  fullScreen();
  
  manager = new StateManager(this);
  //manager.data.loadImages();
  //manager.data.loadSounds(this);
  
  //TESTING
  Enemy shark = new Enemy(manager.data);
  shark.level = 2;
  manager.data.elements.add(shark);
  
  //FOR TESTING WALLS
  manager.data.elements.add( new Wall(width/2-200,height/2-200) );
  manager.data.elements.add( new Wall(width/2+200,height/2-200) );
  manager.data.elements.add( new Wall(width/2-200,height/2+200) );
  manager.data.elements.add( new Wall(width/2+200,height/2+200) );
  manager.data.elements.add( new Wall(width/2-200,height/2+200) );
  manager.data.elements.add( new Wall(width/2+200,height/2+200) );
}

void draw()
{
  manager.update();
  manager.display();
  
  //TESTING
  //credit.xPos = mouseX;
  //credit.yPos = mouseY;
  //for( int i = 0; i < manager.data.player.upgrades.size(); i++ )
  //{
  //  text( manager.data.player.upgrades.get(i).getName(), 20, height - 50*i);
  //}
  text( manager.data.elements.size(), 50, height-100 );
}

void keyPressed()
{
  manager.keyReact(true);
  
  //TESTING
  //if( key == 'x' )
  //  manager.data.elements.add( new Enemy( manager.data ) );
  if (key == 'j' )
  {
      manager.data.player.exp += 10;
  }
}

void keyReleased()
{
  manager.keyReact(false);
}

void mousePressed()
{
  manager.clickReact(true);
  
  //TESTING
  //if( key == 't' )
  //manager.data.elements.add( new Trident(manager.data,1) );
}

void mouseReleased()
{
  manager.clickReact(false);
}
