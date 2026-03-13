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
  
  Button pauseButton = new Button("Play", 200, 200, 200, 100);
  
  void update(StateManager manager){
    //manager.player.stopMoving();
  }
  void display(StateManager manager){
    background(255, 255, 255);
    pauseButton.drawButton();
    fill(0, 0, 0);
    textSize(60);
    textAlign(CENTER);
    text("Game Paused", width/2, height/2.5);
    
  }
  void keyReact(StateManager manager,boolean pressed){
    if(key == 'p' && pressed){
      manager.changeState(new StatePlay());
    }
  }
  void clickReact(StateManager manager,boolean pressed){
    if(pressed){
      pauseButton.pressIf(pauseButton.underMouse());
    }
    else{
      if(pauseButton.clicked()){
        manager.changeState(new StatePlay());
      }
      pauseButton.pressed = false;
    }
  }
}
