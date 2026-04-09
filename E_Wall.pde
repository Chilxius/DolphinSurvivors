// ** Wednesday **
//Finish creating Wall objects
//Walls do not need to move, and for now do not need to deal with collision
//Once the object is created (including the necessary methods (update, display, isEnemy):
  //Remove the abstract from the class description
  //Un-comment the four wall additions in setup() to test it

abstract class Wall extends GameElement
{
  Wall(){ layer = 1; }
  
  @Override
  void collide(GameElement other) { other.collideWithWall(this); }
}
