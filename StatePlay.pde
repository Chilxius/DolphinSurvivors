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
  void update(StateManager manager) {
  
  }
  
  void display(StateManager manager) {
    
  }
  
  void keyReact(StateManager manager, boolean pressed) {
    
  }
  
  void clickReact(StateManager manager, boolean pressed) {
  
  }
}
