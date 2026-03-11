//****************************************************
// Game Over - Can go to start screen or quick restart
//****************************************************
//
//*******************************************
class StateGameOver extends GameState
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
Show a darkened image of the final moment from the play state
Show some text on top of that that lets the player know the game is over (GAME OVER, YOU DIED, GIT GUD, etc.)
  You could create a list of phrases and choose from it
Have that text fade in (have an opacity variable that increases in update())
Have options to return to title or restart the game
Show stats for this run (enemies destroyed, upgrades achieved, level reached, pickups collected, etc.)
*/
