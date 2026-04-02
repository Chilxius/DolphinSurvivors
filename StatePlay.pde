//*******************************************
// Game Running - Player moving and fighting
//*******************************************
// Moses C & Peter Tumlison
//*******************************************


/*
For now, you will just provide a button to pause, a button to level up, and a button to lose (go to game over)
 
 Have keyReact send commands to the Player (access Player through Manager -> GameData)
 Show and update all game elements (just player for now)
 Get the timer working, test it with some visual cue like changing background
 Whenever the game switches to play state, reset gameData's nextTick to be millis()+tickDelay-tickBoost
 The millis() function tells how many milliseconds have passed since the game began
 Whenever nextTick > millis(), it means another tick has occured
 Trigger all upgrades
 Reset nextTick to millis()+tickDelay-tickBonus
 */



class StatePlay implements GameState {
  HashMap<String, Button> buttons = new HashMap<>();
  String [] buttonNames = {"Pause", "Level Up", "Game Over"};
  int nextEventTimer = 1000;
  int tick = 1; 
  boolean tickOn = false;
  int lastMillis = millis() % 100;


  StatePlay () {
    GameState [] buttonStates = {new StatePause(), new StateLevelUp(), new StateGameOver()};
    for (int i = 0; i < buttonNames.length; i++) {
      String name = buttonNames[i];
      buttons.put(name, new Button(name, width/4, height/3 + ((height/4)*i), height/5, width/10 ));
      buttons.get(name).setNextState(buttonStates[i]);
    }
  }

  void update(StateManager manager) {
    for ( GameElement e : manager.data.elements) {
      e.update();
      
    }
    updateTick();
  }

  void display(StateManager manager) {
    background(200);
    for (Button b : buttons.values()) {
      b.drawButton();
    }
    for ( GameElement e : manager.data.elements) {
      e.display(manager.data);
    }
    //println(getTick());
  }

  private void updateTick() { // counts up the ticks
    if (-10 < lastMillis - (millis() % 100 ) && lastMillis - (millis() % 100) < 10) {
      tickOn = true;
    }

    if (tick == 10&& tickOn == true) {
      tick = 1;
      tickOn = false;
    } else if (tickOn == true) {
      tick +=1;
      tickOn = false;
    }
  }

int getTick() { //other methods can call this - reutrns 1-10
return tick;
}


  void keyReact(StateManager manager, boolean pressed) {
  }

  void clickReact(StateManager manager, boolean pressed) {
    for (Button b : buttons.values()) {
      if (pressed)
      {
        b.pressIf(b.underMouse());
      } else
      {
        if (b.clicked()) {
          manager.changeState(b.getState());
        }
        b.release();
      }
    }
  }
}


/*

 //*******************************************
 // Game Running - Player moving and fighting
 //*******************************************
 // Moses C & Peter Tumlison
 //*******************************************
 
 */
