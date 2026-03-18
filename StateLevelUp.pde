//**********************************************
// Level Up - Waiting for player to pick upgrade
//**********************************************
/*

 
 
 
 */
//*******************************************


/*
Cassie (done) - Show a message congratulating the player
 
 Bobby - Pick two random upgrades (make sure they are different)
 
 Cassie - Display the name and description of each upgrade with its icon and a button to select it
 
 Bobby - The text of the button could be the name of the upgrade, or it could be a big button with the name and description on it
 There are three dummy upgrades in the Player object you can use for testing
 
 Bobby (done) - Have the background be an image of the play state (get this using get()) so the player will know how the game will resume
 Bobby - Have some frame for the upgrade buttons; don't just have them floating in space
 */
class StateLevelUp implements GameState
{
  //fields
  boolean firstTime = true;
  Player p;
  PImage background;
  Button button1;
  Button button2;
  Upgrade[] upgrades = new Upgrade[2];
  Upgrade upgrade1;
  Upgrade upgrade2;


  StateLevelUp()
  {
    firstTime = true;
    background = get();



    println("LLL");
  }
  void keyReact(StateManager manager, boolean pressed)
  {
  }
  void clickReact(StateManager manager, boolean pressed)
  {
    if (pressed)
    {
      button1.pressIf(button1.underMouse());
    } else
    {
      if ( button1.clicked() )
      {
        button1.release();
        manager.changeState(new StatePlay() );
      }
    }

    if (pressed)
    {
      button2.pressIf(button2.underMouse());
    } else
    {
      if ( button2.clicked() )
      {
        button2.release();
        manager.changeState(new StatePlay() );
      }
    }
  }
  void update(StateManager manager)
  {
    if (firstTime)
    {
      p = manager.data.player;



      upgrades[0] = p.upgrades.get(0);
      int temp = (int)random(0, 2);
      upgrade1 = upgrades[0];
      while (upgrades[temp] == upgrade1)
      {
        temp = (int)random(0, 2);
      }
      upgrade2 = p.upgrades.get(temp);
    }

    button1 = new Button(upgrade1.getName(), (width/2) - 100, height/2, 100, 100);
    button2 = new Button(upgrade2.getName(), (width/2) + 100, height/2, 100, 100);
  }
  void display(StateManager manager)
  {
    background(#62FF75);
    button1.drawButton();
    button2.drawButton();
    //image(background,width,height);
    tint(100);
    text("Level Up!", width/2 - 100, height/2 - 100);
  }
}
