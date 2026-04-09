// Lyndon worked on E Decoration

// ** WEDNESDAY **
//Give decoration a duration timer variable which counts down every time it draws
//Once the timer runs out, it should mark itself as dead
//Create a Bubble child class that moves upward when it draws

abstract class Decoration extends GameElement{
  Decoration(){
    layer = 0;
  }
  
  // collision
  //@Override
  //void collide(GameElement other) { other.collideWithDecoration(this); }
  
  void update(){
    // Nothing yet
  }
  void displayTwoFish(GameData data){
    data.showImage("twoFish", width/2, height/2);
  }
  
  void displaySeaMine(GameData data){
    data.showImage("seaMine", width/2, height/2);
  }
}
