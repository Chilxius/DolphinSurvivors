// Lyndon worked on E Decoration

// ** WEDNESDAY **
//Give decoration a duration timer variable which counts down every time it draws
//Once the timer runs out, it should mark itself as dead
//Create a Bubble child class that moves upward when it draws

abstract class Decoration extends GameElement{
  
  int time = 500;
  int timer;
  boolean spawnedBubble = false;
  
  Decoration(){
    layer = 0;
  }
  
  void update(){
    // Nothing yet
    //if(/* coin picked up */){
    // Display bubble
    // spawnedBubble = true;
    // updateTime();
    //}
  }
  
  void updateTime(){
    time -= 20;
    print("E Decoration:" + time);
    
    if(time <= 0){
      print("E Decoration: remove image");
      // removeImage();
      time = 500;
    }
  }
  
  //void updateBubble(){
  //  if(spawnedBubble == true){
  //    updateTime();
  //  }
  //}
  
  void displayTwoFish(GameData data){
    data.showImage("twoFish", width/2, height/2);
  }
  
  void displaySeaMine(GameData data){
    data.showImage("seaMine", width/2, height/2);
  }
  
  void displayBubble(GameData data){
    data.showImage("bubble1", data.player.xPos, data.player.yPos);
  }
  
  // collision
  //@Override
  //void collide(GameElement other) { other.collideWithDecoration(this); }
}
