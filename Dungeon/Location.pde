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
    if(!inVerti(L.getLowY()) && inVerti(L.getY()) && (inHori(L.getX()) || inHori(L.getRightX()))){
      L.y = botY;
    }
    if(!inVerti(L.getY()) && inVerti(L.getLowY()) && (inHori(L.getX()) || inHori(L.getRightX()))){
      L.y = y-L.Dheight;
    }
    if(inHori(L.getX()) && (inVerti(L.getY()) || inVerti(L.getLowY()))){
      L.x = rightX;
    }
    if(inHori(L.getRightX()) && (inVerti(L.getY()) || inVerti(L.getLowY()))){
      L.x = x+L.Dwidth;
    }
  }
  
  void display(){
    fill(255);
   rect(x,y,w,h); 
  }
}
