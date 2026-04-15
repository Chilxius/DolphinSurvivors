//*******************************************
// Game Running - Player moving and fighting
//*******************************************
// Moses C & Peter Tumlison
//*******************************************

// ** Wednesday ***
// Have the game spawn an enemy every so often
// Edit Player so that, every tick, player's update() causes Player to use() each of Player's upgrades - this should cause attacks to auto-fire

// Change the previous screen logic so that:
// The faded out background in pause/gameover looks correct
// Update restarts correctly

// Chris j - UI


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
  int nextTick = 0;
  boolean tickOn = false;
  int lastMillis = millis() % 100;
  int tickRate = 100;
  float scaleH = 0;
  float healthD = 0;
  float mHealthD = 0;

  CollisionSystem collider = new CollisionSystem();

  StatePlay () {
    //GameState [] buttonStates = {new StatePause(), new StateLevelUp(), new StateGameOver()};
    //for (int i = 0; i < buttonNames.length; i++) {
    //  String name = buttonNames[i];
    //  buttons.put(name, new Button(name, width/4, height/3 + ((height/4)*i), height/5, width/10 ));
    //  //buttons.get(name).setNextState(buttonStates[i]);
    //}   // Lyndon commented the buttons.
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
      scaleH = (width/2) / manager.data.player.maxHealth;
      healthD = scaleH * manager.data.player.maxHealth;
      mHealthD = scaleH * manager.data.player.health;
    }

    // check for collisions every update not every frame
    collider.checkCollisions(manager.data.elements);

    updateTick();

    // Changes state to level up once enough xp is gained
    if (manager.data.player.levelUpTime == true) {
      manager.data.player.levelUpTime = false;
      manager.changeState(new StateLevelUp());
    }

    // Changes state to gameOver once player loses health
    if (manager.data.player.health <= 0) {
      manager.changeState(new StateGameOver());
    }
  }
  
  private void backupBackground()
  {
    push();
    noStroke();
    for( int i = 0; i < height; i+=10 )
    {
      fill(0,0,255-i);
      rect(0,i*3,width,30);
    }
    pop();
  }

  void display(StateManager manager) {
    //push();                                                  // Lyndon added push();
    backupBackground();
    //manager.data.showImage("background", width/2, height/2); // Lyndon made a background
    //pop();                                                   // Lyndon added pop();
    for (Button b : buttons.values()) {
      b.drawButton();
    }
    for ( GameElement e : manager.data.elements) {
      e.display(manager.data);
    }
    //println(getTick());
    
    // HP
    push();
    rectMode(CORNERS);
    noStroke();
    fill(50);

    rect(0, 0, manager.data.player.maxHealth*10, 50);
    fill(255, 0, 0);
    rect(0, 0, manager.data.player.health*10, 50);

    textAlign(LEFT, CENTER);
    fill(0);
    text(manager.data.player.health + " / " + manager.data.player.maxHealth, 0, 25);
    pop();

    // Exp
    push();
    rectMode(CORNERS);
    noStroke();
    fill(50);

    rect(0, 50, 300, 100);
    fill(255, 255, 0);
    rect(0, 50, manager.data.player.exp * 3, 100);

    textAlign(LEFT, CENTER);
    fill(0);
    text(manager.data.player.exp+ " / 100 EXP", 0, 75);
    pop();
    // Upgrades
    push();
    float x = 25;
    float y = 125;
    rectMode(CENTER);
    imageMode(CENTER);
    for (Upgrade u : manager.data.player.upgrades) {
      fill(70);
      rect(x, y, 50, 50, 10);
      fill(255);
      if (manager.data.images.containsKey(u.getIconName()) && manager.data.graphicsOn)
        image(manager.data.images.get(u.getIconName()), x, y, 50, 50);
      else
        ellipse(x,y,50,50);
      x += 50;
      if (x >= 250) {
        x = 25;
        y += 50;
      }
    }
    pop();
  }

  void spawnEnemy() {
    manager.data.elements.add( new Enemy(manager.data) );
    println("Enemy spawned at tick " + tick);
  }

  private void updateTick() { // counts up the ticks
    if( millis() > nextTick )
    {
      nextTick += 1000;
      spawnEnemy();
    }
    //if (-10 < lastMillis - (millis() % 100 ) && lastMillis - (millis() % 100) < 10) {
    //  tickOn = true;
    //  //tick system
    //  if (millis() - lastMillis > tickRate) {
    //    tick++;
    //    lastMillis = millis();

    //    println(tick);

    //    //spawns the enemy every 10 ticks (so every single second)
    //    if (tick % 10 == 0) {
    //      spawnEnemy();
    //    }

    //    if (tick == 10&& tickOn == true) {
    //      tick = 1;
    //      tickOn = false;
    //    } else if (tickOn == true) {
    //      tick +=1;
    //      tickOn = false;
    //    }
    //  }
    //}
    
  }

  int getTick() { //other methods can call this - reutrns 1-10
    return tick;
  }

  void keyReact(StateManager manager, boolean pressed) {
    manager.data.player.direct( key, pressed );

    if (key == 'p') {
      manager.changeState(new StatePause());//  Pause state needs to change once it's released
    }
  }

  void clickReact(StateManager manager, boolean pressed) {
    for (Button b : buttons.values()) {
      if (pressed)
      {
        b.pressIf(b.underMouse());
      } else
      {
        if (b.clicked()) {
          manager.previousState = this;
          if (b.text.equals(buttonNames[0])) {
            manager.changeState(new StatePause());
          } else if (b.text.equals(buttonNames[1])) {
            manager.changeState(new StateLevelUp());
          } else if (b.text.equals(buttonNames[2])) {
            manager.changeState(new StateGameOver());
          }
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
