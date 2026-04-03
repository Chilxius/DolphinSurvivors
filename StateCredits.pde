//*******************************************
// Credits Roll
//*******************************************
//
//*******************************************


class StateCredits implements GameState {

  /////////////////////////////////////////////////////////////////

  //Button code//

  //Returns to title
  Button creditsButton = new Button("Return to Title", width -105, height -105, 200, 200);
  //Increase credits speed.
  Button speedUp = new Button("Increase speed", width -105, height -260, 200, 100);
  //Pause and unpause credits
  Button playPause = new Button("Play/ Pause", width -105, height -365, 200, 100);

  /////////////////////////////////////////////////////////////////
 public int yPos; // Position of the text
    public String[] credits = {"Produced by Me",
      "",
      "Music by Artist",
      "",
      "Graphics by Designer"};

  StateCredits() {
    

    yPos = height;
    
  }

  void update(StateManager manager) {

    
    


    yPos -= 1; //scrolling speed

    //// Reset when text leaves the screen
    //if (yPos < -100) {
    //  yPos = height;
    //}
  }



  /////////////////////////////////////////////////////////////////

  //Displays Credits and UI//

  void display(StateManager manager) {

    background(0);
    creditsButton.drawButton();
    speedUp.drawButton();
    playPause.drawButton();
    
    
    
    
    ////
    textAlign(CENTER);
    textSize(24);




    // text color white
    fill(255);

    // Display each line
    for (int i = 0; i < credits.length; i++) {

      text(credits[i], width/2, yPos + (i * 30));
    }
    ////
  }
  /////////////////////////////////////////////////////////////////

  void keyReact(StateManager manager, boolean pressed) {
  }


  /////////////////////////////////////////////////////////////////

  //Button React code//

  void clickReact(StateManager manager, boolean pressed) {

    //To title screen button
    if (pressed) {

      creditsButton.pressIf(creditsButton.underMouse());
    } else {
      if (creditsButton.clicked()) {

        manager.changeState(new StateIntroScreen());
      }

      creditsButton.pressed = false;
    }
    //////////////////////////////////////////////////////////////////
  }

  //  void creditsRole(){

  //    float yPos; // Position of the text
  //String[] credits = {"Produced by Me",
  //                            "",
  //                    "Music by Artist",
  //                            "",
  //                  "Graphics by Designer"};



  //  yPos = height;
  //  textAlign(CENTER);
  //  textSize(24);




  //  // text color white
  //  fill(255);

  //  // Display each line
  //  for (int i = 0; i < credits.length; i++) {

  //    text(credits[i], width/2, yPos + (i * 30));
  //  }

  //  yPos -= 1; //scrolling speed

  //  //// Reset when text leaves the screen
  //  //if (yPos < -100) {
  //  //  yPos = height;
  //  //}


  //  }
}



/////////
/*
    To Do:
 
 - Credit box object
 x size
 x speed
 
 
 */
//////////

/*
Should have a button/keypress to return to the title screen
 Should tell who worked on what - get info from other states (or, like, talk to people)
 Scroll the credits upward, repeat when they get off screen
 Have a button that, when pressed, speeds up the credit scroll (and show a prompt for this)
 Decorate with images from the game
 
 Use a text command with five arguments: text, x, y, width, height
 This allows you to fit the text to a box, and that box can be moved around
 */
