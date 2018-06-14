class Key{
  PImage i;
  float x,y;
  boolean taken;
  Key(float _x, float _y){
    i = loadImage("key.png");
    taken = false;
    x = _x;
    y = _y;
  }
  
  boolean isKey(Link fg){
     if (dist(fg.x,fg.y,x,y) <= 5){
       taken = true;
     }
     return taken;
  }
  
  void display(){
    if (!taken){
     image(i,x,y,15,15); 
    }  
  }
}
