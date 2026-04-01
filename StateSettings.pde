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

  // palette set (

  Button graphicButton = new Button("Graphics", width - 200, 50, 150, 100);
  Button leaveButton = new Button("Leave", width/2, height-50, 200, 100);
  Button backButton = new Button("Back", width/2, height-100, 100, 50);

  Button shantellButton = new Button("Shantell", width - 200, 300, 150, 100);
  Button morphButton = new Button("Morph", width - 200, 400, 150, 100);
  Button cmuButton = new Button("CMU", width -  200, 500, 150, 100);
  Button calibraButton = new Button(":)", width -  200, 600, 150, 100);

  int butx = width/6;
  int voly = 250;
  int wvol = 75;
  int hvol = 50;
  Button volume1 = new Button("0", butx, voly, wvol, hvol);
  Button volume2 = new Button("", butx+wvol, voly, wvol, hvol);
  Button volume3 = new Button("50", butx+2*wvol, voly, wvol, hvol);
  Button volume4 = new Button("", butx+3*wvol, voly, wvol, hvol);
  Button volume5 = new Button("100", butx+4*wvol, voly, wvol, hvol);

  Button svolume1 = new Button("0", butx, voly+hvol, wvol, hvol);
  Button svolume2 = new Button("", butx+wvol, voly+hvol, wvol, hvol);
  Button svolume3 = new Button("50", butx+2*wvol, voly+hvol, wvol, hvol);
  Button svolume4 = new Button("", butx+3*wvol, voly+hvol, wvol, hvol);
  Button svolume5 = new Button("100", butx+4*wvol, voly+hvol, wvol, hvol);

  Button mvolume1 = new Button("0", butx, voly+2*hvol, wvol, hvol);
  Button mvolume2 = new Button("", butx+wvol, voly+2*hvol, wvol, hvol);
  Button mvolume3 = new Button("50", butx+2*wvol, voly+2*hvol, wvol, hvol);
  Button mvolume4 = new Button("", butx+3*wvol, voly+2*hvol, wvol, hvol);
  Button mvolume5 = new Button("100", butx+4*wvol, voly+2*hvol, wvol, hvol);

  int spdy = 525;
  int spdh = 50;
  Button speed1 = new Button("Slow", butx+2*wvol, spdy+4*spdh, 150, spdh);
  Button speed2 = new Button("", butx+2*wvol, spdy+3*spdh, 100, spdh);
  Button speed3 = new Button("Half", butx+2*wvol, spdy+2*spdh, 150, spdh);
  Button speed4 = new Button("", butx+2*wvol, spdy+spdh, 100, spdh);
  Button speed5 = new Button("FULL", butx+2*wvol, spdy, 150, spdh);

  StateSettings() {
    pauseScreen = get();

    //      Super duper jank
    //      Checks if the button has been toggled before, if so swaps the colours to be based on the state it is
    //      Starts out true, if closed and reopened, it doesn't reset to true

    volume1.setSubordinate(volume2);
    volume2.setSubAndSup(volume1, volume3);
    volume3.setSubAndSup(volume2, volume4);
    volume4.setSubAndSup(volume3, volume5);
    volume5.setSuperior(volume4);
    
    svolume1.setSubordinate(svolume2);
    svolume2.setSubAndSup(svolume1, svolume3);
    svolume3.setSubAndSup(svolume2, svolume4);
    svolume4.setSubAndSup(svolume3, svolume5);
    svolume5.setSuperior(svolume4);
    
    mvolume1.setSubordinate(mvolume2);
    mvolume2.setSubAndSup(mvolume1, mvolume3);
    mvolume3.setSubAndSup(mvolume2, mvolume4);
    mvolume4.setSubAndSup(mvolume3, mvolume5);
    mvolume5.setSuperior(mvolume4);
    
    speed1.setSubordinate(speed2);
    speed2.setSubAndSup(speed1, speed3);
    speed3.setSubAndSup(speed2, speed4);
    speed4.setSubAndSup(speed3, speed5);
    speed5.setSuperior(speed4);

    graphicButton.changeIdleColors2(color(150, 250, 150), color(200, 250, 200));
    graphicButton.changeIdleColors(color(50, 250, 50), color(100, 250, 100));
    graphicButton.changeClickedColors2(color(255), color(125));
    graphicButton.changeClickedColors(color(125), color(50));

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

    svolume1.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    svolume1.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    svolume1.changeIdleColors(color(255), color(125));
    svolume1.changeIdleColors2(color(125), color(50));

    svolume2.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    svolume2.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    svolume2.changeIdleColors(color(255), color(125));
    svolume2.changeIdleColors2(color(125), color(50));

    svolume3.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    svolume3.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    svolume3.changeIdleColors(color(255), color(125));
    svolume3.changeIdleColors2(color(125), color(50));

    svolume4.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    svolume4.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    svolume4.changeIdleColors(color(255), color(125));
    svolume4.changeIdleColors2(color(125), color(50));

    svolume5.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    svolume5.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    svolume5.changeIdleColors(color(255), color(125));
    svolume5.changeIdleColors2(color(125), color(50));

    mvolume1.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    mvolume1.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    mvolume1.changeIdleColors(color(255), color(125));
    mvolume1.changeIdleColors2(color(125), color(50));

    mvolume2.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    mvolume2.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    mvolume2.changeIdleColors(color(255), color(125));
    mvolume2.changeIdleColors2(color(125), color(50));

    mvolume3.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    mvolume3.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    mvolume3.changeIdleColors(color(255), color(125));
    mvolume3.changeIdleColors2(color(125), color(50));

    mvolume4.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    mvolume4.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    mvolume4.changeIdleColors(color(255), color(125));
    mvolume4.changeIdleColors2(color(125), color(50));

    mvolume5.changeClickedColors(color(150, 250, 150), color(200, 250, 200));
    mvolume5.changeClickedColors2(color(50, 250, 50), color(100, 250, 100));
    mvolume5.changeIdleColors(color(255), color(125));
    mvolume5.changeIdleColors2(color(125), color(50));
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

    if (manager.data.masterVolume == 1) {
      volume1.setToggled(true);
      volume2.setToggled(true);
      volume3.setToggled(true);
      volume4.setToggled(true);
      volume5.setToggled(true);
    }
    if (manager.data.masterVolume == .75) {
      volume1.setToggled(true);
      volume2.setToggled(true);
      volume3.setToggled(true);
      volume4.setToggled(true);
      volume5.setToggled(false);
    }
    if (manager.data.masterVolume == .5) {
      volume1.setToggled(true);
      volume2.setToggled(true);
      volume3.setToggled(true);
      volume4.setToggled(false);
      volume5.setToggled(false);
    }
    if (manager.data.masterVolume == .25) {
      volume1.setToggled(true);
      volume2.setToggled(true);
      volume3.setToggled(false);
      volume4.setToggled(false);
      volume5.setToggled(false);
    }
    if (manager.data.masterVolume == 0) {
      volume1.setToggled(true);
      volume2.setToggled(false);
      volume3.setToggled(false);
      volume4.setToggled(false);
      volume5.setToggled(false);
    }

    if (manager.data.sfxVolume == 1) {
      svolume1.setToggled(true);
      svolume2.setToggled(true);
      svolume3.setToggled(true);
      svolume4.setToggled(true);
      svolume5.setToggled(true);
    }
    if (manager.data.sfxVolume == .75) {
      svolume1.setToggled(true);
      svolume2.setToggled(true);
      svolume3.setToggled(true);
      svolume4.setToggled(true);
      svolume5.setToggled(false);
    }
    if (manager.data.sfxVolume == .5) {
      svolume1.setToggled(true);
      svolume2.setToggled(true);
      svolume3.setToggled(true);
      svolume4.setToggled(false);
      svolume5.setToggled(false);
    }
    if (manager.data.sfxVolume == .25) {
      svolume1.setToggled(true);
      svolume2.setToggled(true);
      svolume3.setToggled(false);
      svolume4.setToggled(false);
      svolume5.setToggled(false);
    }
    if (manager.data.sfxVolume == 0) {
      svolume1.setToggled(true);
      svolume2.setToggled(false);
      svolume3.setToggled(false);
      svolume4.setToggled(false);
      svolume5.setToggled(false);
    }

    if (manager.data.musicVolume == 1) {
      mvolume1.setToggled(true);
      mvolume2.setToggled(true);
      mvolume3.setToggled(true);
      mvolume4.setToggled(true);
      mvolume5.setToggled(true);
    }
    if (manager.data.musicVolume == .75) {
      mvolume1.setToggled(true);
      mvolume2.setToggled(true);
      mvolume3.setToggled(true);
      mvolume4.setToggled(true);
      mvolume5.setToggled(false);
    }
    if (manager.data.musicVolume == .5) {
      mvolume1.setToggled(true);
      mvolume2.setToggled(true);
      mvolume3.setToggled(true);
      mvolume4.setToggled(false);
      mvolume5.setToggled(false);
    }
    if (manager.data.musicVolume == .25) {
      mvolume1.setToggled(true);
      mvolume2.setToggled(true);
      mvolume3.setToggled(false);
      mvolume4.setToggled(false);
      mvolume5.setToggled(false);
    }
    if (manager.data.musicVolume == 0) {
      mvolume1.setToggled(true);
      mvolume2.setToggled(false);
      mvolume3.setToggled(false);
      mvolume4.setToggled(false);
      mvolume5.setToggled(false);
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
    ellipse(butx+2*wvol, 430, 300, 100);
    ellipse(butx+2*wvol, 180, 300, 100);
    rectMode(CENTER);
    rect(butx-1.7*wvol, voly+.75*hvol, 175, hvol*3.5, 15);
    pop();
    fill(0);
    text("SETTINGS", width/2, 50);
    text("SPEED", butx+2*wvol, 450);
    text("Sounds", butx+2*wvol, 200);
    text("Master", butx-1.7*wvol, voly);
    text("SFX", butx-1.7*wvol, voly+hvol);
    text("Music", butx-1.7*wvol, voly+2*hvol);
    pop();

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

    svolume1.drawButton();
    svolume2.drawButton();
    svolume3.drawButton();
    svolume4.drawButton();
    svolume5.drawButton();

    mvolume1.drawButton();
    mvolume2.drawButton();
    mvolume3.drawButton();
    mvolume4.drawButton();
    mvolume5.drawButton();

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
      graphicButton.pressIf( graphicButton.underMouse() );
      leaveButton.pressIf( leaveButton.underMouse() );
      backButton.pressIf( backButton.underMouse() );
      volume1.pressIf( volume1.underMouse() );
      volume2.pressIf( volume2.underMouse() );
      volume3.pressIf( volume3.underMouse() );
      volume4.pressIf( volume4.underMouse() );
      volume5.pressIf( volume5.underMouse() );

      svolume1.pressIf( svolume1.underMouse() );
      svolume2.pressIf( svolume2.underMouse() );
      svolume3.pressIf( svolume3.underMouse() );
      svolume4.pressIf( svolume4.underMouse() );
      svolume5.pressIf( svolume5.underMouse() );

      mvolume1.pressIf( mvolume1.underMouse() );
      mvolume2.pressIf( mvolume2.underMouse() );
      mvolume3.pressIf( mvolume3.underMouse() );
      mvolume4.pressIf( mvolume4.underMouse() );
      mvolume5.pressIf( mvolume5.underMouse() );
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
        manager.data.soundsOn = false;
        volume1.setToggled(true);
        volume1.chainReact();
        manager.data.masterVolume = 0;
        manager.data.sfxVolume = 0;
        manager.data.musicVolume = 0;

        svolume1.setToggled(true);
        svolume2.setToggled(false);
        svolume3.setToggled(false);
        svolume4.setToggled(false);
        svolume5.setToggled(false);
        mvolume1.setToggled(true);
        mvolume2.setToggled(false);
        mvolume3.setToggled(false);
        mvolume4.setToggled(false);
        mvolume5.setToggled(false);
      }
      if ( volume2.clicked()) {
        manager.data.soundsOn = true;
        volume2.setToggled(true);
        volume2.chainReact();
        manager.data.masterVolume = .25;
      }
      if ( volume3.clicked()) {
        manager.data.soundsOn = true;
        volume3.setToggled(true);
        volume3.chainReact();
        manager.data.masterVolume = .5;
      }
      if ( volume4.clicked()) {
        manager.data.soundsOn = true;
        volume4.setToggled(true);
        volume4.chainReact();
        manager.data.masterVolume = .75;
      }
      if ( volume5.clicked()) {
        manager.data.soundsOn = true;
        volume5.setToggled(true);
        volume5.chainReact();
        manager.data.masterVolume = 1;
      }

      ////

      if ( svolume1.clicked()) {
        svolume1.setToggled(true);
        svolume2.setToggled(false);
        svolume3.setToggled(false);
        svolume4.setToggled(false);
        svolume5.setToggled(false);
        manager.data.sfxVolume = 0;
      }
      if ( svolume2.clicked()) {
        if (manager.data.masterVolume == 0 ) {
          manager.data.masterVolume = 25;
          volume1.setToggled(true);
          volume2.setToggled(true);
        }
        manager.data.soundsOn = true;
        svolume1.setToggled(true);
        svolume2.setToggled(true);
        svolume3.setToggled(false);
        svolume4.setToggled(false);
        svolume5.setToggled(false);
        manager.data.sfxVolume = .25;
      }
      if ( svolume3.clicked()) {
        if (manager.data.masterVolume == 0 ) {
          manager.data.masterVolume = 25;
          volume1.setToggled(true);
          volume2.setToggled(true);
        }
        manager.data.soundsOn = true;
        svolume1.setToggled(true);
        svolume2.setToggled(true);
        svolume3.setToggled(true);
        svolume4.setToggled(false);
        svolume5.setToggled(false);
        manager.data.sfxVolume = .5;
      }
      if ( svolume4.clicked()) {
        if (manager.data.masterVolume == 0 ) {
          manager.data.masterVolume = 25;
          volume1.setToggled(true);
          volume2.setToggled(true);
        }
        manager.data.soundsOn = true;
        svolume1.setToggled(true);
        svolume2.setToggled(true);
        svolume3.setToggled(true);
        svolume4.setToggled(true);
        svolume5.setToggled(false);
        manager.data.sfxVolume = .75;
      }
      if ( svolume5.clicked()) {
        if (manager.data.masterVolume == 0 ) {
          manager.data.masterVolume = 25;
          volume1.setToggled(true);
          volume2.setToggled(true);
        }
        manager.data.soundsOn = true;
        svolume1.setToggled(true);
        svolume2.setToggled(true);
        svolume3.setToggled(true);
        svolume4.setToggled(true);
        svolume5.setToggled(true);
        manager.data.sfxVolume = 1;
      }

      ////

      if ( mvolume1.clicked()) {
        mvolume1.setToggled(true);
        mvolume2.setToggled(false);
        mvolume3.setToggled(false);
        mvolume4.setToggled(false);
        mvolume5.setToggled(false);
        manager.data.musicVolume = 0;
      }
      if ( mvolume2.clicked()) {
        if (manager.data.masterVolume == 0 ) {
          manager.data.masterVolume = 25;
          volume1.setToggled(true);
          volume2.setToggled(true);
        }
        manager.data.soundsOn = true;
        mvolume1.setToggled(true);
        mvolume2.setToggled(true);
        mvolume3.setToggled(false);
        mvolume4.setToggled(false);
        mvolume5.setToggled(false);
        manager.data.musicVolume = .25;
      }
      if ( mvolume3.clicked()) {
        if (manager.data.masterVolume == 0 ) {
          manager.data.masterVolume = 25;
          volume1.setToggled(true);
          volume2.setToggled(true);
        }
        manager.data.soundsOn = true;
        mvolume1.setToggled(true);
        mvolume2.setToggled(true);
        mvolume3.setToggled(true);
        mvolume4.setToggled(false);
        mvolume5.setToggled(false);
        manager.data.musicVolume = .5;
      }
      if ( mvolume4.clicked()) {
        if (manager.data.masterVolume == 0 ) {
          manager.data.masterVolume = 25;
          volume1.setToggled(true);
          volume2.setToggled(true);
        }
        manager.data.soundsOn = true;
        mvolume1.setToggled(true);
        mvolume2.setToggled(true);
        mvolume3.setToggled(true);
        mvolume4.setToggled(true);
        mvolume5.setToggled(false);
        manager.data.musicVolume = .75;
      }
      if ( mvolume5.clicked()) {
        if (manager.data.masterVolume == 0 ) {
          manager.data.masterVolume = 25;
          volume1.setToggled(true);
          volume2.setToggled(true);
        }
        manager.data.soundsOn = true;
        mvolume1.setToggled(true);
        mvolume2.setToggled(true);
        mvolume3.setToggled(true);
        mvolume4.setToggled(true);
        mvolume5.setToggled(true);
        manager.data.musicVolume = 1;
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
      graphicButton.release();
      leaveButton.release();
      backButton.release();

      volume1.release();
      volume2.release();
      volume3.release();
      volume4.release();
      volume5.release();
      svolume1.release();
      svolume2.release();
      svolume3.release();
      svolume4.release();
      svolume5.release();
      mvolume1.release();
      mvolume2.release();
      mvolume3.release();
      mvolume4.release();
      mvolume5.release();

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
