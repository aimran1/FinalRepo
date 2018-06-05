class Location{
  float x,y,h,w;
  color c;
  Location(float X,float Y,float H,float W){
    x=X;
    y=Y;
    h=H;
    w=W;
   }
  
  
  Location(float X,float Y,float H,float W, char dead, color C){
    x=X;
    y=Y;
    w=H;
    h=W;
    c = C;
  }
  
  void display(){
   fill(c);
   stroke(c);
   rect(x,y,w,h); 
  }
}
