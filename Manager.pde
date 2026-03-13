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

interface GameState
{
  void update(StateManager manager);
  void display(StateManager manager);
  void keyReact(StateManager manager,boolean pressed);
  void clickReact(StateManager manager,boolean pressed);
}
