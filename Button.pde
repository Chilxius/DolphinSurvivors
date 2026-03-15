class Button
{
  private float xPos, yPos;
  private float xSize, ySize;
  private boolean pressed;
  private String text;
  
  //for toggle buttons
  private boolean toggled;
  color base1, click1, border1, clickBorder1,
        base2, click2, border2, clickBorder2;
        
  //for holding the state
  private GameState nextState = null;
  
  Button( String t, float x, float y, float w, float h )
  {
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
    text = t;
    
    //defalut colors
    base1 = color(255);
    border1 = color(125);
    click1 = color(125);
    clickBorder1 = color(50);
    
    base2 = color(150,150,250);
    border2 = color(200,200,250);
    click2 = color(50,50,250);
    clickBorder2 = color(100,100,250);
  }
  
  public void drawButton()
  {
    push();
    if(!toggled)
    {
      if(!pressed)
      {
        fill(base1);
        stroke(border1);
      }
      else
      {
        fill(click1);
        stroke(clickBorder1);
      }
    }
    else
    {
      if(pressed)
      {
        fill(base2);
        stroke(border2);
      }
      else
      {
        fill(click2);
        stroke(clickBorder2);
      }
    }
    strokeWeight(4);
    rectMode(CENTER);
    rect(xPos,yPos,xSize,ySize,20);
    fill(0);
    textAlign(CENTER,CENTER);
    text(text,xPos,yPos,xSize,ySize);
    pop();
  }
  public void changeIdleColors( color a, color b )
  {
    base1 = a;
    border1 = b;
  }
  public void changeClickedColors( color a, color b )
  {
    click1 = a;
    clickBorder1 = b;
  }
  public void changeIdleColors2( color a, color b )
  {
    base2 = a;
    border2 = b;
  }
  public void changeClickedColors2( color a, color b )
  {
    click2 = a;
    clickBorder2 = b;
  }
  public void toggle()
  {
    toggled = !toggled;
  }
  
  public void setNextState( GameState state )
  {
    nextState = state;
  }
  
  public GameState getState()
  {
    return nextState;
  }
  
  public void release()
  {
    pressed = false;
  }
  public boolean pressed()
  {
    return pressed;
  }
  public void pressIf( boolean p ) //Confirm button was pressed
  {
    pressed = p;
    //if(pressed)
      //playSound
  }
  public boolean clicked() //Confirm button was pressed and released
  {
    return underMouse() && pressed;
  }
  public boolean underMouse()
  {
    return mouseX > xPos-xSize/2
        && mouseX < xPos+xSize/2
        && mouseY > yPos-ySize/2
        && mouseY < yPos+ySize/2;
  }
}
