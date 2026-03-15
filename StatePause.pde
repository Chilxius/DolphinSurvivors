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

class StatePause implements GameState{
  PImage pauseScreen;
  
  StatePause(){
    pauseScreen = get();
  }
  Button pauseButton = new Button("Back To Game", width/2, height/1.8, 300, 150);
  Button settingsButton = new Button("Settings", width/2, height/1.25, 200, 100);
  
  void update(StateManager manager){
    //manager.player.stopMoving();
  }
  void display(StateManager manager){
    background(255, 255, 255);
    pauseButton.drawButton();
    settingsButton.drawButton();
    push();
    fill(0, 0, 0);
    textSize(height/15);
    textAlign(CENTER);
    text("Game Paused\n\nPress 'p' Or Click The Button To Play", width/2, height/4);
    pop();
    
  }
  void keyReact(StateManager manager,boolean pressed){
    if(key == 'p' && pressed){
      manager.changeState(new StatePlay());
    }
  }
  void clickReact(StateManager manager,boolean pressed){
    
    // Check whether the pause button got pressed or not
    if(pressed){
      pauseButton.pressIf(pauseButton.underMouse());
    }
    else{
      if(pauseButton.clicked()){
        manager.previousState = this;
        manager.changeState(new StatePlay());
      }
      pauseButton.pressed = false;
    }
    
   // Check whether the settings button got pressed or not
   if(pressed){
      settingsButton.pressIf(settingsButton.underMouse());
    }
    else{
      if(settingsButton.clicked()){
        manager.previousState = this;
        manager.changeState(new StateSettings());
      }
      settingsButton.pressed = false;
    }
  }
}
