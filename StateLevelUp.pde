//**********************************************
// Level Up - Waiting for player to pick upgrade
//**********************************************
/*

 
 
 
 */
//*******************************************

// ** WEDNESDAY **
// Finish adding decoration to make the page look nice
//A border for the text box describing the upgrade
// Go to Button and add text to the PictureButton (where the comment is) - I have added text to the button's constructor

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
    //background = get();
  }
  void keyReact(StateManager manager, boolean pressed)
  {
  }
  void clickReact(StateManager manager, boolean pressed)
  {
    if (pressed)
    {

      if (button1.underMouse() )
      {
        manager.data.sounds.get("Upgrade").play();

        p.upgrades.add(upgrade1.upgrade(manager.data));
        p.upgrades.remove(upgrade1);

        manager.changeState(new StatePlay());
      }
      if (button2.underMouse() )
      {
        manager.data.sounds.get("Upgrade").play();

        p.upgrades.add(upgrade2.upgrade(manager.data));
        p.upgrades.remove(upgrade2);

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

      button1 = new PictureButton(upgrade1.getIconName(), upgrade1.getName(), (width/2) - 300, height/2 - 50, 300, 250);
      button2 = new PictureButton(upgrade2.getIconName(), upgrade2.getName(), (width/2) + 300, height/2 - 50, 300, 250);
    }
  }
  void display(StateManager manager)
  {
    if( button1 == null || button2 == null ) return;
    
    background(#0091F0);
    button1.drawButton();
    button2.drawButton();
    push();
    textSize(40);
    text("Level Up!", width/2 - 90, height/2 - 150);
    pop();

    if (button1.underMouse())
    {
      push();
      fill(#4900C1);
      rectMode(CENTER);
      rect((width/2), height/2 + 230, 500, 250);
      fill(255, 255, 255);
      text(upgrade1.getDescription(), (width/2), height/2 + 230, 450, 200);
      pop();
    }
    if (button2.underMouse())
    {
      push();
      fill(#4900C1);
      rectMode(CENTER);
      rect((width/2), height/2 + 230, 500, 250);
      fill(255, 255, 255);
      text(upgrade2.getDescription(), (width/2), height/2 + 230, 450, 200);
      pop();
    }
  }
}
