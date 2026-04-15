class StateManager
{
  GameState state;
  GameState previousState;
  GameData data;
  
  StateManager( PApplet app )
  {
    data = new GameData(app);
    state = new StateIntroScreen();
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
  
  void showImage(String s, float x, float y)
  {
    data.showImage(s,x,y);
  }
  
  void keyReact(boolean pressed)
  {
    state.keyReact(this,pressed);
  }
  
  void clickReact(boolean pressed)
  {
    state.clickReact(this,pressed);
  }
  
  public void restart()
  {
    data.restart();
  }
}

interface GameState
{
  void update(StateManager manager);
  void display(StateManager manager);
  void keyReact(StateManager manager,boolean pressed);
  void clickReact(StateManager manager,boolean pressed);
}
