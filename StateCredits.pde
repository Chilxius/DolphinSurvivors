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
  Button creditsButton = new Button("Return to Title", width -105, height -105, 200, 200);
  //Increase credits speed.
  Button speedUp = new Button("Increase speed", width -105, height -260, 200, 100);
  //Pause and unpause credits
  Button playPause = new Button("Play/ Pause", width -105, height -365, 200, 100);

  /////////////////////////////////////////////////////////////////
  
  private int numFrames = 2;  // The number of frames in the animation
  private int currentFrame = 0;
  private PImage[] images = new PImage[numFrames];
 // private PImage img;
  private int nextFrame = 0;


  StateCredits(){
  
    images[0]  = loadImage("citrine.png");
  images[0].resize(width, height);
  images[1]  = loadImage("blueFish.png"); 
  images[1].resize(width, height);
  }

  void update(StateManager manager) {


  //  img = loadImage("bacon.png");
  //img.resize(width, height);
  
  
  background(0);
  if(millis() > nextFrame){
    nextFrame += 10000;
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  }
    image(images[(currentFrame) % numFrames], 0, -20);
    
    

  }



  /////////////////////////////////////////////////////////////////

  //Displays Credits and UI//

  void display(StateManager manager) {

    creditsButton.drawButton();
    speedUp.drawButton();
    playPause.drawButton();


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
