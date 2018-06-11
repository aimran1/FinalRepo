class Potion{
  int health; 
  PImage p = loadImage("potion.PNG");
  Potion(){}
  
  boolean isPotion(Link fg){
     if (dist(fg.x,fg.y,x,y) <= 5){
       taken = true;
     }
     return taken;
  }
  
  void display(){
   image(p,15,15); 
  }
}
