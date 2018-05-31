class Location{
  float x,y,h,w,botY,rightX;
  Location(float X,float Y,float H,float W){
    x=X;
    y=Y;
    h=H;
    w=W;
    botY = y + h;
    rightX= x + w;
  }
  
  
  boolean inVerti(float value){
    return value > y && value < botY;
  }
  
  boolean inHori(float value){
    return value > x && value < rightX;
  }
  
  void update(Link L){
   playerCollision(L); 
  }
  
  void playerCollision(Link L){
    if(( inVerti(L.getY()) || inVerti(L.getLowY()) ) &&  (inHori(L.getX()) || inHori(L.getRightX()))){
      L.x-=L.vx;
      L.y-=L.vy;
      /*
      if(inHori(L.getX()) && !inHori(L.getRightX())){
        L.x = rightX;
      }
      if(inHori(L.getRightX()) && !inHori(L.getX())){
        L.x = x-L.Dwidth;
      }
      if(inVerti(L.getY()) && !inVerti(L.getLowY())){
        L.y = rightX;
      }
      if(inVerti(L.getLowY()) && !inVerti(L.getY())){
        L.y = y-L.Dheight;
      }
      */
    }
  }
  
  void display(){
    fill(0);
   rect(x,y,w,h); 
  }
}
