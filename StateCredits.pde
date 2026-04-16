//*******************************************
// Credits Roll
//*******************************************
//
//*******************************************

// ** WEDNESDAY ***
// Finish creating CreditsBox object
// Un-comment the code in draw() to test if it works (it should follow the mouse)
// For testing, create several CreditsBox objects in this class at different y positions and have them all move upward

class StateCredits implements GameState {

  /////////////////////////////////////////////////////////////////

  //Button code//

  //Returns to title
  Button creditsButton = new Button("Return to Title", width -105, height -55, 200, 100);
  

  /////////////////////////////////////////////////////////////////
  
  private int numFrames = 4;  // The number of frames in the animation
  private int currentFrame = 0;
  private PImage[] images = new PImage[numFrames];
 // private PImage img;
  private int nextFrame = millis();


  StateCredits(){
  
    images[0]  = loadImage("citrine.png");
    images[0].resize(width, height);
    images[1]  = loadImage("betaTest .png"); 
    images[1].resize(width, height);
    images[2]  = loadImage("bacon.png"); 
    images[2].resize(width, height);
    images[3]  = loadImage("Untitled presentation.png"); 
    images[3].resize(width, height);
  }

  void update(StateManager manager) {


  //  img = loadImage("bacon.png");
  //img.resize(width, height);
  
  
  background(0);
  if(millis() > nextFrame){
    nextFrame += 10000;
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  }
    image(images[(currentFrame) % numFrames], width/2, height/2);
    
    

  }



  /////////////////////////////////////////////////////////////////

  //Displays Credits and UI//

  void display(StateManager manager) {

    creditsButton.drawButton();
    


  }
  /////////////////////////////////////////////////////////////////

  void keyReact(StateManager manager, boolean pressed) {
  }


  /////////////////////////////////////////////////////////////////

  //Button React code//

  void clickReact(StateManager manager, boolean pressed) {

    //To title screen button
    if (pressed) {

      creditsButton.pressIf(creditsButton.underMouse());
    } else {
      if (creditsButton.clicked()) {

        manager.changeState(new StateIntroScreen());
      }

      creditsButton.pressed = false;
    }
    //////////////////////////////////////////////////////////////////
  }

  
}
