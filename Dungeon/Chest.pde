class Chest{
 Item thing;
 int x,y;
 PImage i;
 Chest(Item e,int _x,int _y){
    i = loadImage("chest1.PNG");  
    x = _x;
    y = _y;
    thing = e;
 }
 
 Item getItem(){
   i = loadImage("chest2.PNG");
   return thing;
 }
 
 void display(){
  image(i,x,y); 
 }

}
