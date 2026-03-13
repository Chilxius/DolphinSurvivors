//*******************************************
// Credits Roll
//*******************************************
//
//*******************************************

class StateCredits implements GameState{
  
  Button creditsButton = new Button("Return to Title",600,600,200,200);
  void update(StateManager manager){}
  void display(StateManager manager){
  
    background(255);
    creditsButton.drawButton();
  }
  void keyReact(StateManager manager,boolean pressed){}
  
  void clickReact(StateManager manager,boolean pressed){
    
    if(pressed){
      
       creditsButton.pressIf(creditsButton.underMouse());
    }
    
    else
     {
       if(creditsButton.clicked()){
         manager.changeState(new StateIntroScreen());
       }
       creditsButton.pressed = false;
  }
  
  
}


/*
Should have a button/keypress to return to the title screen
Should tell who worked on what - get info from other states (or, like, talk to people)
Scroll the credits upward, repeat when they get off screen
Have a button that, when pressed, speeds up the credit scroll (and show a prompt for this)
Decorate with images from the game

Use a text command with five arguments: text, x, y, width, height
  This allows you to fit the text to a box, and that box can be moved around
*/
//   Button creditsButton = new Button("Return to Title",600,600,200,200); = code for button
