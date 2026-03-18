//*************************************************
// Title Screen - can go to play, settings, credits
//*************************************************
// Sean Breshears
//*******************************************


/*
Show the title of the game
Have options to go to credits, settings, or play
Have something moving/changing on the screen so that the game looks interesting <- a spinning fat rat
*/

class StateIntroScreen implements GameState
{
  Button startButton = new Button("start", width/2,350,200,100);
  Button settingsButton = new Button("settings", width/2,500,200,100);
  Button creditsButton = new Button("credits", width/2,650,200,100);
  Button quitButton = new Button("quit", width/2, 800, 200, 100);
  void update(StateManager manager)
  {
    
  }
  void display(StateManager manager)
  {
    background(#00CAE3);
    push();
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("Dolphin Survivors",width/2, height/2-350);
    pop();
    startButton.drawButton();
    settingsButton.drawButton();
    creditsButton.drawButton();
    quitButton.drawButton();
    
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
       quitButton.pressIf(quitButton.underMouse());
     }
     else
     {
       if(startButton.clicked()){
         manager.changeState(new StatePlay());
       }
       if(settingsButton.clicked()){
         manager.previousState = this;
         manager.changeState(new StateSettings());
       }
       if(creditsButton.clicked()){
         manager.changeState(new StateCredits());
       }
       if(quitButton.clicked()){
         exit();
       }
       startButton.pressed = false;
       settingsButton.pressed = false;
       creditsButton.pressed = false;
       quitButton.pressed = false;
     }
     
  }
}
