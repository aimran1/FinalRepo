class Chest{
 Item thing;
 int x,y;
 PImage i;
 Chest(int _x,int _y){
    i = loadImage("chest1.PNG");  
    x = _x;
    y = _y;
  //  thing = e;
 }
 
  void getItem(Link fg){
   i = loadImage("chest2.PNG");
   fg.keys -= 1;
 }
 
 void display(){
   imageMode(CENTER);
  image(i, x,y,50,50); 
 }
 
}
