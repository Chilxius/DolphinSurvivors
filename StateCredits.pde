//*******************************************
// Credits Roll
//*******************************************
//
//*******************************************


class StateCredits implements GameState{
  
  /////////////////////////////////////////////////////////////////
  
  //Button code//
  
  //Returns to title
  Button creditsButton = new Button("Return to Title", width -105, height -105,200,200);
  //Increase credits speed. 
  Button speedUp = new Button("Increase speed", width -105, height -260,200,100);
  //Pause and unpause credits
  Button playPause = new Button("Play/ Pause",width -105, height -365,200,100);
  
  /////////////////////////////////////////////////////////////////
  
  
  void update(StateManager manager){}
  
  /////////////////////////////////////////////////////////////////
  
  //Displays Credits and UI//
  
  void display(StateManager manager){
  
    background(0);
    creditsButton.drawButton();
    speedUp.drawButton();
    playPause.drawButton();
  }
  /////////////////////////////////////////////////////////////////
  
  void keyReact(StateManager manager,boolean pressed){}
  
  
  /////////////////////////////////////////////////////////////////
  
  //Button React code//
  
  void clickReact(StateManager manager,boolean pressed){
    
    //To title screen button
    if(pressed){
      
       creditsButton.pressIf(creditsButton.underMouse());
    }
    else{
       if(creditsButton.clicked()){
         
          manager.changeState(new StateIntroScreen());
       }
       
       creditsButton.pressed = false;
    }
  //////////////////////////////////////////////////////////////////
  }
}

/////////
/*



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
