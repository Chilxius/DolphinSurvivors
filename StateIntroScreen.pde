//*************************************************
// Title Screen - can go to play, settings, credits
//*************************************************
//
//*******************************************
class StateIntroScreen extends GameState
{
  Button testButton = new Button("START", 500, 500, 200, 100);
  
  void update(StateManager manager)
  {
    
  }
  void display(StateManager manager)
  {
    testButton.drawButton();
  }
  void keyReact(StateManager manager, boolean pressed)
  {
  }
  void clickReact(StateManager manager,boolean pressed)
  {
    if( pressed )
      testButton.pressIf( testButton.underMouse() );
    else
    {
      if( testButton.clicked() ) manager.changeState( new StatePlay() );
      
      testButton.release();
    }
  }
}

/*
Show the title of the game
Have options to go to credits, settings, or play
Have something moving/changing on the screen so that the game looks interesting
*/
