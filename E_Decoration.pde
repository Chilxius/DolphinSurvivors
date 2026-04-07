// Lyndon worked on E Decoration

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
