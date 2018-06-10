class Location{
  float x,y,h,w;
  float[] jerk;
  color c;
  Location(float X,float Y,float H,float W){
    x=X;
    y=Y;
    h=H;
    w=W;
    jerk = new float[4];
    jerk[0] = x;
    jerk[1] = y;
    jerk[2] = h;
    jerk[3] = w;
   }
  
  
  Location(float X,float Y,float H,float W, char dead, color C){
    x=X;
    y=Y;
    w=H;
    h=W;
    c = C;
  }
  
  void kill(){
    x = -1;
    y = -1;
    h = -1;
    w = -1;
  }
  
  void restore(){
    x = jerk[0];
    y = jerk[1];
    h = jerk[2];
    w = jerk[3];
  }
  
  void display(){
   fill(c);
   stroke(c);
   rect(x,y,w,h); 
  }
}
