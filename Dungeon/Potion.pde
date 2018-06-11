class Potion extends Item{
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
     if (dist(fg.x,fg.y,x,y) <= 5){
       taken = true;
       fg.hp += health;
     }
     return taken;
  }
  
  void display(){
   image(p,x,y,25,25); 
  }  
}
