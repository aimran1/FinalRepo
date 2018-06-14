class Chest{
 int x,y;
 boolean open;
 PImage i;
 Chest(int _x,int _y){
    i = loadImage("chest1.PNG");  
    x = _x;
    y = _y;
 }
 
  void getItem(Link fg){
   i = loadImage("chest2.PNG");
   open = true;

 }
 
 void display(){
   imageMode(CENTER);
  image(i, x,y,25,25); 
 }
 
}
