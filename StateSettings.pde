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
  Button soundButton = new Button("Sounds", 200, 400, 150, 100);
  Button graphicButton = new Button("Graphics", width - 200, 50, 150, 100);
  Button leaveButton = new Button("Leave", width/2, height-50, 200, 100);
  Button backButton = new Button("Back", width/2, height-100, 100, 50);

  Button shantellButton = new Button("Shantell", width - 200, 300, 150, 100);
  Button morphButton = new Button("Morph", width - 200, 400, 150, 100);
  Button cmuButton = new Button("CMU", width -  200, 500, 150, 100);
  Button calibraButton = new Button(":)", width -  200, 600, 150, 100);

  Button volume1 = new Button("", 200, 325, 50, 50);
  Button volume2 = new Button("", 200, 275, 50, 50);
  Button volume3 = new Button("", 200, 225, 50, 50);
  Button volume4 = new Button("", 200, 175, 50, 50);
  Button volume5 = new Button("", 200, 125, 50, 50);

  Button speed1 = new Button("Slow", width/2, 475, 150, 50);
  Button speed2 = new Button("", width/2, 425, 100, 50);
  Button speed3 = new Button("Half", width/2, 375, 150, 50);
  Button speed4 = new Button("", width/2, 325, 100, 50);
  Button speed5 = new Button("FULL", width/2, 275, 150, 50);

  StateSettings() {
    pauseScreen = get();

    soundButton.setToggled(true);

    //      Super duper jank
    //      Checks if the button has been toggled before, if so swaps the colours to be based on the state it is
    //      Starts out true, if closed and reopened, it doesn't reset to true

    graphicButton.changeIdleColors2(color(150, 250, 150), color(200, 250, 200));
    graphicButton.changeIdleColors(color(50, 250, 50), color(100, 250, 100));
    graphicButton.changeClickedColors2(color(255), color(125));
    graphicButton.changeClickedColors(color(125), color(50));

    soundButton.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    soundButton.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    soundButton.changeIdleColors(color(255), color(125));
    soundButton.changeIdleColors2(color(125), color(50));

    volume1.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    volume1.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    volume1.changeIdleColors(color(255), color(125));
    volume1.changeIdleColors2(color(125), color(50));

    volume2.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    volume2.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    volume2.changeIdleColors(color(255), color(125));
    volume2.changeIdleColors2(color(125), color(50));

    volume3.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    volume3.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    volume3.changeIdleColors(color(255), color(125));
    volume3.changeIdleColors2(color(125), color(50));

    volume4.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    volume4.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    volume4.changeIdleColors(color(255), color(125));
    volume4.changeIdleColors2(color(125), color(50));

    volume5.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    volume5.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    volume5.changeIdleColors(color(255), color(125));
    volume5.changeIdleColors2(color(125), color(50));

    // SPEEEEEEEEED

    speed1.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    speed1.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    speed1.changeIdleColors(color(255), color(125));
    speed1.changeIdleColors2(color(125), color(50));

    speed2.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    speed2.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    speed2.changeIdleColors(color(255), color(125));
    speed2.changeIdleColors2(color(125), color(50));

    speed3.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    speed3.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    speed3.changeIdleColors(color(255), color(125));
    speed3.changeIdleColors2(color(125), color(50));

    speed4.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    speed4.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    speed4.changeIdleColors(color(255), color(125));
    speed4.changeIdleColors2(color(125), color(50));

    speed5.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    speed5.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    speed5.changeIdleColors(color(255), color(125));
    speed5.changeIdleColors2(color(125), color(50));

    if (manager.data.graphicsOn == false) graphicButton.toggle();
    if (manager.data.soundsOn == false) soundButton.setToggled(false);

    if (manager.data.masterVolume == 1) {
      volume1.setToggled(true);
      volume2.setToggled(true);
      volume3.setToggled(true);
      volume4.setToggled(true);
      volume5.setToggled(true);
    }
    if (manager.data.masterVolume == .8) {
      volume1.setToggled(true);
      volume2.setToggled(true);
      volume3.setToggled(true);
      volume4.setToggled(true);
      volume5.setToggled(false);
    }
    if (manager.data.masterVolume == .6) {
      volume1.setToggled(true);
      volume2.setToggled(true);
      volume3.setToggled(true);
      volume4.setToggled(false);
      volume5.setToggled(false);
    }
    if (manager.data.masterVolume == .4) {
      volume1.setToggled(true);
      volume2.setToggled(true);
      volume3.setToggled(false);
      volume4.setToggled(false);
      volume5.setToggled(false);
    }
    if (manager.data.masterVolume == .2) {
      volume1.setToggled(true);
      volume2.setToggled(false);
      volume3.setToggled(false);
      volume4.setToggled(false);
      volume5.setToggled(false);
    }



    if (manager.data.gameSpeed == 60) {
      speed1.setToggled(true);
      speed2.setToggled(true);
      speed3.setToggled(true);
      speed4.setToggled(true);
      speed5.setToggled(true);
    }
    if (manager.data.gameSpeed == 45) {
      speed1.setToggled(true);
      speed2.setToggled(true);
      speed3.setToggled(true);
      speed4.setToggled(true);
      speed5.setToggled(false);
    }
    if (manager.data.gameSpeed == 30) {
      speed1.setToggled(true);
      speed2.setToggled(true);
      speed3.setToggled(true);
      speed4.setToggled(false);
      speed5.setToggled(false);
    }
    if (manager.data.gameSpeed == 15) {
      speed1.setToggled(true);
      speed2.setToggled(true);
      speed3.setToggled(false);
      speed4.setToggled(false);
      speed5.setToggled(false);
    }
    if (manager.data.gameSpeed == 5) {
      speed1.setToggled(true);
      speed2.setToggled(false);
      speed3.setToggled(false);
      speed4.setToggled(false);
      speed5.setToggled(false);
    }
  }

  void display(StateManager manager) {
    push();
    tint(45);
    image(pauseScreen, width/2, height/2);
    pop();
    push();
    textAlign(CENTER);
    textSize(50);
    push();
    fill(255);
    noStroke();
    ellipse(width/2, 30, 400, 100);
    ellipse(width/2, 180, 200, 100);
    pop();
    fill(0);
    text("SETTINGS", width/2, 50);
    text("SPEED", width/2, 205);
    pop();

    soundButton.drawButton();
    graphicButton.drawButton();
    leaveButton.drawButton();
    backButton.drawButton();

    push();
    manager.data.setFont("Shantell");
    shantellButton.drawButton();
    manager.data.setFont("Morph");
    morphButton.drawButton();
    manager.data.setFont("CMU");
    cmuButton.drawButton();
    manager.data.setFont("Caibra");
    calibraButton.drawButton();
    pop();

    volume1.drawButton();
    volume2.drawButton();
    volume3.drawButton();
    volume4.drawButton();
    volume5.drawButton();

    speed1.drawButton();
    speed2.drawButton();
    speed3.drawButton();
    speed4.drawButton();
    speed5.drawButton();
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
      volume1.pressIf( volume1.underMouse() );
      volume2.pressIf( volume2.underMouse() );
      volume3.pressIf( volume3.underMouse() );
      volume4.pressIf( volume4.underMouse() );
      volume5.pressIf( volume5.underMouse() );
      speed1.pressIf( speed1.underMouse() );
      speed2.pressIf( speed2.underMouse() );
      speed3.pressIf( speed3.underMouse() );
      speed4.pressIf( speed4.underMouse() );
      speed5.pressIf( speed5.underMouse() );
      shantellButton.pressIf( shantellButton.underMouse() );
      morphButton.pressIf( morphButton.underMouse() );
      cmuButton.pressIf( cmuButton.underMouse() );
      calibraButton.pressIf( calibraButton.underMouse() );
    }
    if (!b) {
      if ( soundButton.clicked() ) {
        if (manager.data.soundsOn == true) {
          soundButton.setToggled(false);
          manager.data.soundsOn = false;
        }
        volume1.setToggled(false);
        volume2.setToggled(false);
        volume3.setToggled(false);
        volume4.setToggled(false);
        volume5.setToggled(false);
      }

      if (shantellButton.clicked() ) {
        manager.data.setFont("Shantell");
      }
      if (morphButton.clicked() ) {
        manager.data.setFont("Morph");
      }
      if ( cmuButton.clicked() ) {
        manager.data.setFont("CMU");
      }
      if ( calibraButton.clicked() ) {
        manager.data.setFont("Calibra");
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

      // volume is JANK

      if ( volume1.clicked()) {
        manager.data.soundsOn = true;
        soundButton.setToggled(true);
        volume1.setToggled(true);
        volume2.setToggled(false);
        volume3.setToggled(false);
        volume4.setToggled(false);
        volume5.setToggled(false);
        manager.data.masterVolume = .2;
      }
      if ( volume2.clicked()) {
        manager.data.soundsOn = true;
        soundButton.setToggled(true);
        volume1.setToggled(true);
        volume2.setToggled(true);
        volume3.setToggled(false);
        volume4.setToggled(false);
        volume5.setToggled(false);
        manager.data.masterVolume = .4;
      }
      if ( volume3.clicked()) {
        manager.data.soundsOn = true;
        soundButton.setToggled(true);
        volume1.setToggled(true);
        volume2.setToggled(true);
        volume3.setToggled(true);
        volume4.setToggled(false);
        volume5.setToggled(false);
        manager.data.masterVolume = .6;
      }
      if ( volume4.clicked()) {
        manager.data.soundsOn = true;
        soundButton.setToggled(true);
        volume1.setToggled(true);
        volume2.setToggled(true);
        volume3.setToggled(true);
        volume4.setToggled(true);
        volume5.setToggled(false);
        manager.data.masterVolume = .8;
      }
      if ( volume5.clicked()) {
        manager.data.soundsOn = true;
        soundButton.setToggled(true);
        volume1.setToggled(true);
        volume2.setToggled(true);
        volume3.setToggled(true);
        volume4.setToggled(true);
        volume5.setToggled(true);
        manager.data.masterVolume = 1;
      }

      if ( speed1.clicked()) {
        speed1.setToggled(true);
        speed2.setToggled(false);
        speed3.setToggled(false);
        speed4.setToggled(false);
        speed5.setToggled(false);
        manager.data.gameSpeed = 5;
      }
      if ( speed2.clicked()) {
        speed1.setToggled(true);
        speed2.setToggled(true);
        speed3.setToggled(false);
        speed4.setToggled(false);
        speed5.setToggled(false);
        manager.data.gameSpeed = 15;
      }
      if ( speed3.clicked()) {
        speed1.setToggled(true);
        speed2.setToggled(true);
        speed3.setToggled(true);
        speed4.setToggled(false);
        speed5.setToggled(false);
        manager.data.gameSpeed =  30;
      }
      if ( speed4.clicked()) {
        speed1.setToggled(true);
        speed2.setToggled(true);
        speed3.setToggled(true);
        speed4.setToggled(true);
        speed5.setToggled(false);
        manager.data.gameSpeed = 45;
      }
      if ( speed5.clicked()) {
        speed1.setToggled(true);
        speed2.setToggled(true);
        speed3.setToggled(true);
        speed4.setToggled(true);
        speed5.setToggled(true);
        manager.data.gameSpeed = 60;
      }


      //Un-press buttons
      soundButton.release();
      graphicButton.release();
      leaveButton.release();
      backButton.release();

      volume1.release();
      volume2.release();
      volume3.release();
      volume4.release();
      volume5.release();

      speed1.release();
      speed2.release();
      speed3.release();
      speed4.release();
      speed5.release();
    }
  }

  void keyReact(StateManager manager, boolean b) {
  }
}
