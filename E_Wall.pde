// ** Wednesday **
//Finish creating Wall objects
// done Walls do not need to move, and for now do not need to deal with collision
//Once the object is created (including the necessary methods (update, display, isEnemy):
  //done Remove the abstract from the class description
  //done Un-comment the four wall additions in setup() to test it

class Wall extends GameElement
{
  float x;
  float y;

  Wall(float x, float y){ 
    layer = 1;
    this.x = x;
    this.y = y;
    
  }
  
  @Override
  void collide(GameElement other) { other.collideWithWall(this); }
  
  void update(){
    
  }
  
void display( GameData data ){
  manager.data.showImage("wall",x,y);
  }
  
  boolean isEnemy(){
    return false;
  }
}
