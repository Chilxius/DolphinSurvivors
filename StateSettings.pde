//********************************************
// Settings Screen - change sound and graphics
//********************************************
// Chris 1 & 2
// what are our roles
//*******************************************

/*
Provide buttons to turn graphics on/off and sound on/off
 Make sure there is a clear indication of what state the game is currently in
 You could have two buttons, one to turn graphics on and one to turn them off, and only display/check the appropriate button
 Provide a way to return to the previous state, which could be pause, intro, or potentially something else
 Make sure it's clear what screen the player is looking at and what all the buttons do
 */


class StateSettings implements  GameState {
  PImage pauseScreen;
  Button soundButton = new Button("Sounds", 200, 50, 150, 100);
  Button graphicButton = new Button("Graphics", width - 200, 50, 150, 100);
  Button leaveButton = new Button("Leave", width/2, height-50, 200, 100);
  Button backButton = new Button("Back", width/2, height-100, 100, 50);


  StateSettings() {
    pauseScreen = get();
  }

  void display(StateManager manager) {
    push();
      tint(45);
      image(pauseScreen,0,0);
    pop();
    push();
    textAlign(CENTER);
    textSize(50);
    fill(0);
    text("SETTINGS", width/2, 50);
    pop();
    soundButton.drawButton();
    graphicButton.drawButton();
    leaveButton.drawButton();
    backButton.drawButton();
  }

  void update(StateManager manager) {
  }

  void clickReact(StateManager manager, boolean b) {
    //Pressed on button
    if (b) {
      soundButton.pressIf( soundButton.underMouse() );
      graphicButton.pressIf( graphicButton.underMouse() );
      leaveButton.pressIf( leaveButton.underMouse() );
      backButton.pressIf( backButton.underMouse() );
    }
    if (!b) {
      if ( soundButton.clicked() ) {
        manager.data.soundsOn = !manager.data.soundsOn;
        soundButton.toggle();
      }
      if ( graphicButton.clicked() ) {
        manager.data.graphicsOn = !manager.data.graphicsOn;
        graphicButton.toggle();
      }
      if ( leaveButton.clicked() ) {
        manager.changeState(new StateIntroScreen());
        leaveButton.toggle();
      }
      if ( backButton.clicked() ) {
        manager.changeState(manager.previousState);
        backButton.toggle();
      }

      //Un-press buttons
      soundButton.release();
      graphicButton.release();
      leaveButton.release();
      backButton.release();
    }
  }
  void clickRelease() {} // NO

  void keyReact(StateManager manager, boolean pressed) {} // NO
}
