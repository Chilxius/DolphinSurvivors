class Button
{
  private float xPos, yPos;
  private float xSize, ySize;
  private boolean pressed;
  private String text;
  
  Button( String t, float x, float y, float w, float h )
  {
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
    text = t;
  }
  
  public void drawButton() //Temporary
  {
    if(!pressed)
      fill(255);
    else
      fill(150);
    rectMode(CENTER);
    rect(xPos,yPos,xSize,ySize);
    fill(0);
    textAlign(CENTER,CENTER);
    text(text,xPos,yPos,xSize,ySize);
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
        && mouseY > yPos-ySize/4
        && mouseY < yPos+ySize/4;
  }
}
