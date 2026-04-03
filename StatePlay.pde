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
  int tickRate = 100;

  CollisionSystem collider = new CollisionSystem();

  StatePlay () {
    GameState [] buttonStates = {new StatePause(), new StateLevelUp(), new StateGameOver()};
    for (int i = 0; i < buttonNames.length; i++) {
      String name = buttonNames[i];
      buttons.put(name, new Button(name, width/4, height/3 + ((height/4)*i), height/5, width/10 ));
      buttons.get(name).setNextState(buttonStates[i]);
    }
  }



  void update(StateManager manager) {
    // Remove dead elements and update live ones
    for (int i = manager.data.elements.size() - 1; i >= 0; i--) {
      GameElement e = manager.data.elements.get(i);
      if (e.dead) {
        manager.data.elements.addAll(e.onDeath());
        manager.data.elements.remove(i);
      } else {
        e.update();
      }
    }

    // check for collisoions every update not every frame
    collider.checkCollisions(manager.data.elements);

    updateTick();
  }

  void display(StateManager manager) {
    background(200);
    manager.data.showImage("background", 1000, height/2); // Lyndon made a background
    for (Button b : buttons.values()) {
      b.drawButton();
    }
    for ( GameElement e : manager.data.elements) {
      e.display(manager.data);
    }
    //println(getTick());
  }

void spawnEnemy() {
    //actually spawn enemy
    println("Enemy spawned at tick " + tick);
}

private void updateTick() { // counts up the ticks
    if (-10 < lastMillis - (millis() % 100 ) && lastMillis - (millis() % 100) < 10) {
      tickOn = true;
      //tick system
      if (millis() - lastMillis > tickRate) {
      tick++;
       lastMillis = millis();

       //spawns the enemy every 10 ticks (so every 1 second)
       if (tick % 10 == 0) {
    spawnEnemy();
    }

    if (tick == 10&& tickOn == true) {
      tick = 1;
      tickOn = false;
     
    } else if (tickOn == true) {
      tick +=1;
      tickOn = false;
    }
  }
}
}

int getTick() { //other methods can call this - reutrns 1-10
    return tick;
}

  void keyReact(StateManager manager, boolean pressed) {
    manager.data.player.direct( key, pressed );
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
