//*******************************************
// Pause Screen
//*******************************************
//
//*******************************************
class StatePause extends GameState
{
  void update(StateManager manager)
  {
  }
  void display(StateManager manager)
  {
  }
  void keyReact(StateManager manager, boolean pressed)
  {
  }
  void clickReact(StateManager manager,boolean pressed)
  {
  }
}

/*
Have a grayed-out screen-grab of the play state
Have the double bar pause symbol in the middle of the screen. The bars can be semi-transparent
  You can use some other visual indication if you want
Have a key press or button to return to play state
When you return to play state, check each directional key to see if it should be pressed or un-pressed
Show some statistics (enemies destroyed, upgrades achieved, level reached, pickups collected, etc.)
Make sure the player's health and exp can be seen
*/
