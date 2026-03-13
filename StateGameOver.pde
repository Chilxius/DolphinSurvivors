//****************************************************
// Game Over - Can go to start screen or quick restart
//****************************************************
// Story Clark
//*******************************************

class StateGameOver implements GameState {
  
  // Fields
  PImage gameOverScreen;
  
  Button returnToTitleButton = new Button("Return To Title", 300, 300, 200, 100);
  Button restartButton = new Button("Restart Game", 300, 300, 200, 100);
  
  int textOpacity;
  
  // Methods
  StateGameOver() {
    gameOverScreen = get(); // Final frame
    
    textOpacity = 0;
  }
  
  void update(StateManager manager) {
    if (textOpacity < 255) {// Text fading in
      textOpacity += 3;
    }
  }
  
  void display(StateManager manager) {
    
    image(gameOverScreen, 0, 0);// Show background
    
    // Overlay
    fill(0, 150);
    rect(0, 0, width, height);
    
    // Title
    fill(255, textOpacity);
    textSize(64);
    textAlign(CENTER);
    if(random(0, 1) > 0.3){
      text("GAME OVER", width/2, 150);
    } else {
      text("YOU'RE DEAD\n[IDIOT]", width/2, 150);// It's a reference guys...
    }
    
    // Stats
    textSize(24);// Text size
    
    text( "Enemies Destroyed: " + manager.data.enemiesKilled
        + "\nLevel Reached: " + manager.data.playerLevel
        + "\nPickups Collected: " + manager.data.pickupsCollected,
        width/2, height/2 );
    
    // Buttons
    returnToTitleButton.drawButton();
    restartButton.drawButton();
 
  }
  
  void keyReact(StateManager manager, boolean pressed) {
    // None needed
  }
  
  void clickReact(StateManager manager, boolean pressed) {
    
    if (pressed) {
   
      if (returnToTitleButton.underMouse()) {
        manager.changeState(new StateIntroScreen());
      }
      
    } else {
      
      if (restartButton.underMouse()) {
        manager.changeState(new StatePlay());
      }
      
    }
      
  }

}


/*
Show a darkened image of the final moment from the play state [done]
Show some text on top of that that lets the player know the game is over (GAME OVER, YOU DIED, GIT GUD, etc.) [done]
  You could create a list of phrases and choose from it [I could...]
Have that text fade in (have an opacity variable that increases in update())
Have options to return to title or restart the game
Show stats for this run (enemies destroyed, upgrades achieved, level reached, pickups collected, etc.)
*/
