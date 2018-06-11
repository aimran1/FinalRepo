class Chest{
 Item thing;
 int x,y;
 PImage i;
 Chest(int _x,int _y,Item e){
    i = loadImage("chest1.PNG");  
    x = _x;
    y = _y;
    thing = e;
 }
 
  void getItem(Link fg){
   i = loadImage("chest2.PNG");
   thing.display();
   fg.keys -= 1;
 }
 
 void display(){
   imageMode(CENTER);
  image(i, x,y,25,25); 
 }
 
}
