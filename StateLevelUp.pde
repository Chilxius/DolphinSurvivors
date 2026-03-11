//**********************************************
// Level Up - Waiting for player to pick upgrade
//**********************************************
//
//*******************************************
class StateLevelUp extends GameState
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
Show a message congratulating the player
Pick two random upgrades (make sure they are different)
Display the name and description of each upgrade with its icon and a button to select it
  The text of the button could be the name of the upgrade, or it could be a big button with the name and description on it
Have the background be an image of the play state (get is using get()) so the player will know how the game will resume
Have some frame for the upgrade buttons; don't just have them floating in space
*/
