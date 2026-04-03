//**********************************************
// Level Up - Waiting for player to pick upgrade
//**********************************************
/*

 
 
 
 */
//*******************************************


/*
Cassie (done) - Show a message congratulating the player
 
 Bobby - Pick two random upgrades (make sure they are different)
 
 Cassie (done) - Display the name and description of each upgrade with its icon and a button to select it
 
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



    //println("LLL");
  }
  void keyReact(StateManager manager, boolean pressed)
  {
  }
  void clickReact(StateManager manager, boolean pressed)
  {
    if (pressed)
    {
      
      if(button1.underMouse() )
      {
        upgrade1.upgrade(manager.data);
        //test
        //System.out.println("DEBUG: Upgraded " + upgrade1.getName());
        manager.changeState(new StatePlay());
      }
      if(button2.underMouse() )
      {
        upgrade2.upgrade(manager.data);
        
        
        //test
        //System.out.println("DEBUG: Upgraded " + upgrade2.getName());
        
        manager.changeState(new StatePlay());
      }
      
      
    }
  }
  void update(StateManager manager)
  {
    if (firstTime)
    {
      p = manager.data.player;



      int temp = (int)random(0, p.upgrades.size() );
      upgrade1 = p.upgrades.get(temp);
      while (p.upgrades.get(temp) == upgrade1)
      {
        temp = (int)random(0, p.upgrades.size() );
      }
      upgrade2 = p.upgrades.get(temp);
      firstTime = false;
    }

    button1 = new Button(upgrade1.getName(), (width/2) - 300, height/2 - 50, 300, 250);
    button2 = new Button(upgrade2.getName(), (width/2) + 300, height/2 - 50, 300, 250);
  }
  void display(StateManager manager)
  {
    background(#62FF75);
    button1.drawButton();
    button2.drawButton();
    push();
      textSize(40);
      text("Level Up!", width/2 - 90, height/2 - 150);
    pop();
    if(button1.underMouse())
    {
      text(upgrade1.getDescription(), (width/2) - 200, height/2 + 200, 450, 200);
    }
    if(button2.underMouse())
    {
      text(upgrade2.getDescription(), (width/2) - 200, height/2 + 200, 450, 200);
    }
  }
}
