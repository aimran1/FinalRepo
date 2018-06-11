class Potion{
  int health;
  int x,y;
  PImage p = loadImage("potion.png");
  boolean taken = false;
  Potion(int _x,int _y){
    x = _x;
    y = _y;
    health = 10;
  }
  
  boolean isPotion(Link fg){
     if (dist(fg.x,fg.y,x,y) <= 10){
       taken = true;
       return true;
     }
     taken = false;
     return taken;
  }
  
  void display(){
    if (taken){}
    else{
   image(p,x,y,15,15); 
}
}
}
