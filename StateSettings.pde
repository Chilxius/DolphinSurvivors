//********************************************
// Settings Screen - change sound and graphics
//********************************************
// Chris 1 & 2
// We do whatever we feel like broski
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
    
    //      Super duper jank   *cough cough* Can be fixed with more button features *cough cough*
    //      Checks if the button has been toggled before, if so swaps the colours to be based on the state it is
    //      Starts out true, if closed and reopened, it doesn't reset to true, changes colours for false state
    
    graphicButton.changeIdleColors2(color(150,250,150),color(200,250,200));
    graphicButton.changeIdleColors(color(50,250,50),color(100,250,100));
    graphicButton.changeClickedColors2(color(255),color(125));
    graphicButton.changeClickedColors(color(125),color(50));
    
    soundButton.changeIdleColors2(color(150,250,150),color(200,250,200));
    soundButton.changeIdleColors(color(50,250,50),color(100,250,100));
    soundButton.changeClickedColors2(color(255),color(125));
    soundButton.changeClickedColors(color(125),color(50));
    
    if (manager.data.graphicsOn == false) graphicButton.toggle();
    if (manager.data.soundsOn == false) soundButton.toggle();
    
  }

  void display(StateManager manager) {
    push();
      tint(45);
      image(pauseScreen,0,0);
    pop();
    push();
    textAlign(CENTER);
    textSize(50);
    push();
      fill(255);
      noStroke();
      ellipse(width/2, 30,400,100);
    pop();
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
      }
      if ( backButton.clicked() ) {
        manager.changeState(manager.previousState);
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
