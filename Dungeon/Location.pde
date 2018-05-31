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
  
  void playerCollision(Link L){
    if(( inVerti(L.getY()) || inVerti(L.getLowY()) ) &&  (inHori(L.getX()) || inHori(L.getRightX()))){
      L.x-=L.vx;
      L.y-=L.vy;
    }
  }
  
  void display(){
    fill(0);
   rect(x,y,w,h); 
  }
}
