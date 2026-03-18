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
{                                                             // v this was 200 but I wanted to test this to see how it looks for differnt sized machines
  Button startButton = new Button("Start", width/2,height/3.05,width/5,100); //350 - height/3.05
  Button settingsButton = new Button("Settings", width/2,height/2.13,width/5,100); //500 - height/2.13
  Button creditsButton = new Button("Credits", width/2,height/1.64,width/5,100); //650 - height/1.64
  Button quitButton = new Button("Quit", width/2, height/1.335, width/5, 100); //800 - height/1.335
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
