// Lyndon worked on E Decoration

// ** WEDNESDAY **
//Give decoration a duration timer variable which counts down every time it draws
//Once the timer runs out, it should mark itself as dead
//Create a Bubble child class that moves upward when it draws (Done)

class Decoration extends GameElement{
  int time = 600;
  int tintTime = 600;
  
  Decoration(GameElement e){
    layer = 0;
    xPos = e.xPos;
    yPos = e.yPos;
  }
  
  boolean isEnemy(){
    return false;
  }
  
  void collide(GameElement other){
    // collide with nothing yet
  }
  
  void update(){
    // Nothing yet
  }
  
  //void displayTwoFish(){
  //  manager.data.showImage("twoFish", width/2, height/2);
  //}
  
  //void displaySeaMine(){
  //  manager.data.showImage("seaMine", width/2, height/2);
  //}
  
  void display(GameData data){
    // Nothing yet
  }
}

class DecorationBubble extends Decoration{
  float ySpeed;
  
  DecorationBubble(GameElement e){
    super(e);
    size = e.size;
  }
  
  void update(){
    time -= 10;
    tintTime -= 10;
    if(time <= 0){
      dead = true;
      time = 600;
    }
    
    // Bubble float up
    ySpeed -= 0.2;
    yPos += ySpeed;
  }

  void display(GameData data){
    push();
    tint(255, tintTime);
    manager.data.showImage("bubble1", xPos, yPos, size);
    pop();
  }
}
