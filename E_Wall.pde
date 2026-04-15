// ** Wednesday **
//Bobby - Created walls
//Finish creating Wall objects
// done Walls do not need to move, and for now do not need to deal with collision
//Once the object is created (including the necessary methods (update, display, isEnemy):
  //done Remove the abstract from the class description
  //done Un-comment the four wall additions in setup() to test it

class Wall extends GameElement
{

  Wall(float x, float y){ 
    layer = 1;
    this.xPos = x;
    this.yPos = y;
    this.ySpd = 1+random(2);
    this.size = 50;
  }
  
  @Override
  void collide(GameElement other) { other.collideWithWall(this); }
  
  void update(){
    yPos -=ySpd;
    if(yPos <=0){
      xPos = random(width);
      yPos = height;
      ySpd = 1+random(2);
      size = 50 + random(100);
      

      
    }
  }
  
void display( GameData data ){
  manager.data.showImage("wall",xPos,yPos,size);
  }
  
  boolean isEnemy(){
    return false;
  }
}
