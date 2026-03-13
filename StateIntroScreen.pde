//*************************************************
// Title Screen - can go to play, settings, credits
//*************************************************
// Sean Breshears
//*******************************************


/*
Show the title of the game
Have options to go to credits, settings, or play
Have something moving/changing on the screen so that the game looks interesting
*/

class StateIntroScreen implements GameState
{
  Button startButton = new Button("start", 800,450,200,100);
  void update(StateManager manager)
  {
    
  }
  void display(StateManager manager)
  {
    background(255);
    startButton.drawButton();
    
  }
  void keyReact(StateManager manager,boolean pressed)
  {/*Doesn't need to keyReact*/}
  void clickReact(StateManager manager,boolean pressed)
  {
     if(pressed)
     {
       startButton.pressIf(startButton.underMouse());
     }
     else
     {
       if(startButton.clicked()){
         manager.changeState(new StatePlay());
       }
       startButton.pressed = false;
     }
     
  }
}
