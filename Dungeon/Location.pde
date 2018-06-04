class Location{
  float x,y,h,w;
  Location(float X,float Y,float H,float W){
    x=X;
    y=Y;
    h=H;
    w=W;
  }
  
  
  Location(float X,float Y,float H,float W, char dead){
    x=X;
    y=Y;
    w=H;
    h=W;
  }
  
  void display(){
    fill(0);
   rect(x,y,w,h); 
  }
}