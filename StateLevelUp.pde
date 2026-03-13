//**********************************************
// Level Up - Waiting for player to pick upgrade
//**********************************************
/*




*/
//*******************************************


/*
Cassie - Show a message congratulating the player

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
  PImage background;
  Button button1;
  Button button2;
  Upgrade[] upgrades;
  Upgrade upgrade1;
  Upgrade upgrade2;
  
  StateLevelUp()
  {
    background = get();
    upgrades = new Upgrade[3];
    int temp = (int)random(0, 2);
    upgrade1 = upgrades[temp];
    while(upgrades[temp] == upgrade1)
    {
      temp = (int)random(0, 2);
    }
       
    button1 = new Button(upgrade1.getName(), (width/2) - 100, height/2, 100, 100);
    button2 = new Button(upgrade2.getName(), (width/2) + 100, height/2, 100, 100);
    
    
  }
  void keyReact(StateManager manager, boolean pressed)
  {}
  void clickReact(StateManager manager, boolean pressed)
  {
    if(pressed)
    {
      button1.pressIf(button1.underMouse());
     
    } else
    {
      if( button1.clicked() )
      {
        button1.release();
        manager.changeState(new StatePlay() );
      }
    }
   
    if(pressed)
    {
      button2.pressIf(button2.underMouse());
     
    } else
    {
      if( button2.clicked() )
      {
        button2.release();
        manager.changeState(new StatePlay() );
      }
     
    }
  }
  void update(StateManager manager)
  {}
  void display(StateManager manager)
  {
    image(background,width,height);
    tint(100);
    text("Level Up", width/2,500);
    
  }
}
