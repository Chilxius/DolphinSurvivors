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
  Button startButton = new Button("start", 800,350,200,100);
  Button settingsButton = new Button("settings", 800,500,200,100);
  Button creditsButton = new Button("credits", 800,650,200,100);
  void update(StateManager manager)
  {
    
  }
  void display(StateManager manager)
  {
    background(255);
    push();
    fill(0);
    textSize(40);
    text("Dolhin Survivors",650, 180);
    pop();
    startButton.drawButton();
    settingsButton.drawButton();
    creditsButton.drawButton();
    
  }
  void keyReact(StateManager manager,boolean pressed)
  {/*Doesn't need to keyReact*/}
  void clickReact(StateManager manager,boolean pressed)
  {
     if(pressed)
     {
       startButton.pressIf(startButton.underMouse());
       settingsButton.pressIf(settingsButton.underMouse());
       creditsButton.pressIf(creditsButton.underMouse());
     }
     else
     {
       if(startButton.clicked()){
         manager.changeState(new StatePlay());
       }
       if(settingsButton.clicked()){
         manager.changeState(new StateSettings());
       }
       if(creditsButton.clicked()){
         manager.changeState(new StateCredits());
       }
       startButton.pressed = false;
       settingsButton.pressed = false;
       creditsButton.pressed = false;
     }
     
  }
}
