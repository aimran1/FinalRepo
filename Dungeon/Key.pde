class Key extends Item{
  PImage i;
  float x,y;
  Key(float _x, float _y){
    i = loadImage("key.png");
    x = _x;
    y = _y;
  }
  
  boolean isKey(){
     return true; 
  }
  
  void display(){
     image(i,x,y,25,25); 
  }
}
