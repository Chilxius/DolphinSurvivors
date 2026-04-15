//*******************************************
// Pause Screen
//*******************************************
// Lyndon Yang worked on the pause state
//*******************************************

/*
Have a grayed-out screen-grab of the play state
 Have the double bar pause symbol in the middle of the screen. The bars can be semi-transparent
 You can use some other visual indication if you want
 Have a key press or button to return to play state
 When you return to play state, check each directional key to see if it should be pressed or un-pressed
 
 Show some statistics (enemies destroyed, upgrades achieved, level reached, pickups collected, etc.)
 Make sure the player's health and exp can be seen
 */

class StatePause implements GameState {
  PImage pauseScreen;

  StatePause() {
    pauseScreen = get(); // Gets the last frame
  }

  // The buttons I created
  Button pauseButton = new Button("Back To Game", width/2, height/1.8, 300, 150);
  Button settingsButton = new Button("Settings", width/2, height/1.35, 200, 100);
  Button saveAndQuitButton = new Button("Quit Game", width/2, height/1.07, 250, 75);

  void update(StateManager manager) {
    manager.data.player.stopMoving();
    //manager.data.resetFont(); // Resets the font when entering pause state
  }
  void display(StateManager manager) {
    // Screen tinting for better pause
    push();
    tint(120);
    imageMode(CENTER);
    image(pauseScreen, width/2, height/2);
    pop();

    push();
    //background(255, 255, 255); // Comment for screen tinting
    pauseButton.drawButton();
    settingsButton.drawButton();
    saveAndQuitButton.drawButton();
    fill(255, 255, 255); // Uncomment for screen tinting
    //fill(0, 0, 0);     // Comment for screen tinting
    textSize(height/15);
    textAlign(CENTER);
    text("Game Paused\n\nClick 'Back To Game' To Unpause", width/2, height/4);
    pop();
    push();
    textAlign(RIGHT);
    textSize(height/35);
    text("Level: " + manager.data.playerLevel, width/1.045, height/20);
    text("Kills: " + manager.data.enemiesKilled, width/1.039, height/12);
    text("Collected Pickups: " + manager.data.pickupsCollected, width/1.04, height/8.8);
    text("Upgrades Unlocked: ", width/1.053, height/6.9);
    pop();
  }
  void keyReact(StateManager manager, boolean pressed) {
    // 'p' now can't unpause the game
    //if(key == 'p' && pressed){
    //  manager.changeState(new StatePlay());
    //}
  }
  void clickReact(StateManager manager, boolean pressed) {

    // Checks whether the pause button got pressed or not
    if (pressed) {
      pauseButton.pressIf(pauseButton.underMouse());
    } else {
      if (pauseButton.clicked()) {
        manager.previousState = this;
        manager.changeState(new StatePlay());
      }
      pauseButton.pressed = false;
    }

    // Checks whether the settings button got pressed or not
    if (pressed) {
      settingsButton.pressIf(settingsButton.underMouse());
    } else {
      if (settingsButton.clicked()) {
        manager.previousState = this;
        manager.changeState(new StateSettings());
      }
      settingsButton.pressed = false;
    }

    // Checks whether the quit button got pressed or not
    if (pressed) {
      saveAndQuitButton.pressIf(saveAndQuitButton.underMouse());
    } else {
      if (saveAndQuitButton.clicked()) {
        manager.previousState = this;
        manager.changeState(new StateIntroScreen());
      }
      saveAndQuitButton.pressed = false;
    }
  }
}
