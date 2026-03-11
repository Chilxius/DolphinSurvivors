class StateManager
{
  GameState state;
  GameState previousState;
  GameData data;
  
  StateManager()
  {
    state = new StateIntroScreen();
    data = new GameData();
  }
  
  void changeState( GameState newState )
  {
    state = newState;
  }
  
  void update()
  {
    state.update(this);
  }
  
  void display()
  {
    state.display(this);
  }
  
  void keyReact(boolean pressed)
  {
    state.keyReact(this,pressed);
  }
  
  void clickReact(boolean pressed)
  {
    state.clickReact(this,pressed);
  }
}

abstract class GameState
{
  abstract void update(StateManager manager);
  abstract void display(StateManager manager);
  abstract void keyReact(StateManager manager,boolean pressed);
  abstract void clickReact(StateManager manager,boolean pressed);
}
