//*************************************************
// Title Screen - can go to play, settings, credits
//*************************************************
// Sean Breshears
//*******************************************


/*
Show the title of the game
Have options to go to credits, settings, or play
Have something moving/changing on the screen so that the game looks interesting <- a randomly sized fat rat
*/

class StateIntroScreen implements GameState
{
  Button startButton = new Button("Start", width/2,height/3.05,width/5,100); //350 - height/3.05
  Button settingsButton = new Button("Settings", width/2,height/2.13,width/5,100); //500 - height/2.13
  Button creditsButton = new Button("Credits", width/2,height/1.64,width/5,100); //650 - height/1.64
  Button quitButton = new Button("Quit", width/2, height/1.335, width/5, 100); //800 - height/1.335
  Button fatRatButton = new Button("The Fat Rat Button", width/10, height/1.05, width/5, 100); //Rat Fat
  boolean fatRatShown = false;
  
  void update(StateManager manager)
  {
    boolean musicPlaying = false;
    
    if (manager.data.currentSong != null)
      musicPlaying = manager.data.currentSong.isPlaying();
      
    if (!musicPlaying && manager.data.songList.size() > 0) //Play song if none else are playing
    {
      int newIndex;
      do 
        newIndex = (int)random(manager.data.songList.size());
      while (newIndex == manager.data.songIndex);
      
      manager.data.songIndex = (int)random(manager.data.songList.size());
      manager.data.songIndex = newIndex;
      
      String songName = manager.data.songList.get(newIndex);
      String fileName = songName + ".mp3";
      
      println("Now playing: " + songName);
      
      if (manager.data.currentSong != null)
      { // Stop current song
        manager.data.currentSong.stop();
      }
      
      //Load one song
      manager.data.currentSong = new SoundFile(manager.data.app, "music/" + fileName);
      manager.data.currentSong.amp(manager.data.masterVolume * manager.data.musicVolume);
      manager.data.currentSong.play();
      
    }  
  }
  
  void display(StateManager manager)
  {
    background(#00CAE3);
    push();
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("Dolphin Survivors",width/2, height/5);
    pop();
    startButton.drawButton();
    settingsButton.drawButton();
    creditsButton.drawButton();
    quitButton.drawButton();
    fatRatButton.drawButton();
    
    if(fatRatShown == true){
       manager.data.showImage("test",mouseX,mouseY);
    }
    
    
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
       fatRatButton.pressIf(fatRatButton.underMouse());
       quitButton.pressIf(quitButton.underMouse());
     }
     else
     {
       if(startButton.clicked()){
         fatRatShown = false;
         manager.restart();
         manager.changeState(new StatePlay());
       }
       if(settingsButton.clicked()){
         fatRatShown = false;
         manager.previousState = this;
         manager.changeState(new StateSettings());
       }
       if(creditsButton.clicked()){
         fatRatShown = false;
         manager.changeState(new StateCredits());
       }
       if(fatRatButton.clicked()){
         fatRatShown = true;
       }
       
       if(quitButton.clicked()){
         fatRatShown = false;
         exit();
       }
       startButton.pressed = false;
       settingsButton.pressed = false;
       creditsButton.pressed = false;
       fatRatButton.pressed = false;
       quitButton.pressed = false;
     }
     
     
  }
  
}
