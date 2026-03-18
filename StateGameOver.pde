//****************************************************
// Game Over - Can go to start screen or quick restart
//****************************************************
// Story Clark
//*******************************************

class StateGameOver implements GameState {

  // Fields
  PImage gameOverScreen;
  Button returnToTitleButton;
  Button restartButton;
  int textOpacity;
  String gameOverText;

  // Methods
  StateGameOver() {
    gameOverScreen = get(); // Final frame

    textOpacity = 0;

    returnToTitleButton = new Button("Return To Title", width/2 + 120, height/2 + 150, 200, 100);
    restartButton = new Button("Restart Game", width/2 - 120, height/2 + 150, 200, 100);

    float ran = random(1); // Random number for the next bit

    if (ran <= 0.2) {
      gameOverText = "YOU'RE DEAD\n[IDIOT]";// It's a reference guys...
    } else if (ran <= 0.4) {
      gameOverText = "YOU DIED\n";
    } else if (ran <= 0.8) {
      gameOverText = "GAME OVER\n";
    } else {
      gameOverText = "TRY AGAIN\n";
    }
  }

  void update(StateManager manager) {
    if (textOpacity < 255) {// Text fading in
      textOpacity += 3;
    }
    println(textOpacity);
  }

  void display(StateManager manager) {

    image(gameOverScreen, 0, 0);// Show background

    // Overlay
    fill(26, 11, 15, 220);
    rect(0, 0, width, height);

    // Title
    pushStyle();
    fill(255, 3, 45, textOpacity);
    textSize(64);
    textAlign(CENTER);
    text(gameOverText, width/2, 300);
    popStyle();

    // Stats
    pushStyle();
    fill(255);
    textAlign(LEFT);
    textSize(24);// Text size

    text( "Enemies Destroyed: " + manager.data.enemiesKilled
      + "\nLevel Reached: " + manager.data.playerLevel
      + "\nPickups Collected: " + manager.data.pickupsCollected,
      width/2 - 120, height/2 );
    popStyle();

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
