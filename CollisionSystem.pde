class CollisionSystem
{
  float maxDistance = 500; //Max distance objects can be from each other and still collide
  
  public void checkCollisions( ArrayList<GameElement> elements )
  {
    for( int i = 0; i < elements.size(); i++ )
    {
      GameElement first = elements.get(i);
      if( first.dead ) continue;
      
      for( int j = i+1; j < elements.size(); j++ )
      {
        GameElement second = elements.get(j);
        if(second.dead) continue;
        
        if( !canCollide(first,second) ) continue; //can't collide
        
        if( collisionOccurs(first,second) )
        {
          //if( first.layer == 4 || second.layer == 4 )
          //  println("First: " + (first.getClass()) + "   Seocond: " + second.getClass() );
            
          first.collide(second);
          second.collide(first);
        }
      }
    }
  }
  
  private boolean canCollide( GameElement first, GameElement second )
  {
    if( first.layer == 0 || second.layer == 0 ) return false;  //decorations don't collide
    if( first.layer == 1 && second.layer == 1 ) return false;  //walls don't collide with each other
    if( first.layer == 2 && second.layer == 2 ) return false;  //projectiles don't collide with each other

    //d = sqrt( (x2-x1)^2 + (y2-y1)^2 )
    float distance = sqrt( pow((first.xPos-second.xPos),2) + pow((first.yPos-second.yPos),2) );
    
    return distance < maxDistance;
  }
  
  private boolean collisionOccurs( GameElement first, GameElement second )
  {  
    return dist(first.xPos,first.yPos,second.xPos,second.yPos) < (first.size+second.size)/2;
  }
}
