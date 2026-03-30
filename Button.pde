class Button
{
  protected float xPos, yPos;
  protected float xSize, ySize;
  protected boolean pressed;
  protected int roundness;
  protected String text;
  
  //for toggle buttons
  protected boolean toggled;
  color base1, click1, border1, clickBorder1,
        base2, click2, border2, clickBorder2;
        
  //for holding the state
  private GameState nextState = null;
  
  //for button chains
  private Button subordinate, superior;
  //Subordinate buttons turn off when this button is pressed
  //Superior buttons are turned on when this button is pressed
  
  Button( String t, float x, float y, float w, float h )
  {
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
    text = t;
    roundness = 20;
    
    //defalut colors
    base1 = color(255);
    border1 = color(125);
    click1 = color(125);
    clickBorder1 = color(50);
    
    base2 = color(150,150,250);
    border2 = color(200,200,250);
    click2 = color(50,50,250);
    clickBorder2 = color(100,100,250);
    
    subordinate = null;
    superior = null;
  }
  
  Button( String t, float x, float y, float w, float h, Button sub, Button sup )
  {
    this(t,x,y,w,h);
    subordinate = sub;
    superior = sup;
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
    rect(xPos,yPos,xSize,ySize,roundness);
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
  public void setToggled( boolean setting )
  {
    toggled = setting;
  }
  public void setRoundness( int r )
  {
    roundness = r;
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
  
  public void setSubordinate( Button b )
  {
    if( b == this ) return;
    subordinate = b;
  }
  public void setSuperior( Button b )
  {
    if( b == this ) return;
    superior = b;
  }
  
  //For chaining button behavoir (setting volume to MEDIUM would also mark HIGH as on and LOW as off)
  public void chainReact()
  {
    if(subordinate != null) subordinate.chainDeactivate();
    if(superior != null)    superior.chainActivate();
  }
  public void chainActivate()
  {
    toggled = true;
    if(superior != null) superior.chainActivate();
  }
  public void chainDeactivate()
  {
    toggled = false;
    if(subordinate != null) subordinate.chainDeactivate();
  }
}

class PictureButton extends Button
{
  PImage image;
  
  PictureButton( PImage pic, float x, float y, float w, float h )
  {
    super("", x, y, w, h);
    image = pic;
  }
  
  @Override
  void drawButton()
  {
    push();
    if(!toggled)
    {
      if(!pressed) { fill(base1);  stroke(border1); }
      else         { fill(click1); stroke(clickBorder1); }
    }
    else
    {
      if(pressed) { fill(base2);  stroke(border2); }
      else        { fill(click2); stroke(clickBorder2); }
    }
    strokeWeight(4);
    rectMode(CENTER);
    rect(xPos,yPos,xSize,ySize,20);
    image( image, xPos, yPos, yPos*.75, yPos*.75 );
    pop();
  }
}
