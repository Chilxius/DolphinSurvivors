//*******************************************
// Game Running - Player moving and fighting
//*******************************************
// Moses C & Peter Tumlison
//*******************************************


/*
For now, you will just provide a button to pause, a button to level up, and a button to lose (go to game over)

Have keyReact send commands to the Player (access Player through Manager -> GameData)
Show and update all game elements (just player for now)
Get the timer working, test it with some visual cue like changing background
  Whenever the game switches to play state, reset gameData's nextTick to be millis()+tickDelay-tickBoost
  The millis() function tells how many milliseconds have passed since the game began
  Whenever nextTick > millis(), it means another tick has occured
    Trigger all upgrades
    Reset nextTick to millis()+tickDelay-tickBonus
*/

class StatePlay implements GameState {
  Button pauseButton = new Button("Pause", width/2, height/3, 300, 100 );
  Button settingsButton = new Button("Setting", width/2, height/2, 300, 100 );
  Button loseButton = new Button("lose", width/2, (height) - (height/3), 300, 100 );
  
  
  
  void update(StateManager manager) {
  
  }
  
  void display(StateManager manager) {
    background(255);
    pauseButton.drawButton();
    settingsButton.drawButton();
    loseButton.drawButton();
  }
  
  void keyReact(StateManager manager, boolean pressed) {
    
  }
  
  void clickReact(StateManager manager, boolean pressed) {
    if(pressed)
     {
       pauseButton.pressIf(pauseButton.underMouse());
       settingsButton.pressIf(settingsButton.underMouse());
       loseButton.pressIf(loseButton.underMouse());
     }
     else
     {
       if(pauseButton.clicked()){
         manager.changeState(new StatePause());
       }
       
       if(settingsButton.clicked()){
         manager.changeState(new StateSettings());
       }
       
       if(loseButton.clicked()){
         manager.changeState(new StateGameOver());
       }
       
       pauseButton.pressed = false;
       settingsButton.pressed = false;
       loseButton.pressed = false;
     }
  }
}


/*

//*******************************************
// Game Running - Player moving and fighting
//*******************************************
// Moses C & Peter Tumlison
//*******************************************


/*
class StatePlay implements GameState {

  ArrayList<Button> buttons = new ArrayList<>();
  //buttons.add( new Button("Pause", width/2, height/2, 300, 100) );
  //buttons.add( new Button("Settings", width/2, height/2, 300, 100 ) );
  //buttons.add( new Button("lose", width/2, height/2, 300, 100 ) );

  void update(StateManager manager) {
  }

  void display(StateManager manager) {
    for (Button b : buttons) {
      b.drawButton();
    }
  }

  void keyReact(StateManager manager, boolean pressed) {
  }

  void clickReact(StateManager manager, boolean pressed) {
    for (Button b : buttons) {
      if (pressed)
      {
        b.pressIf(b.underMouse());
      } else
      {
        if (b.clicked()) {
          manager.changeState(new StatePlay());
        }
        b.pressed = false;
      }
    }
  }
}


*/
