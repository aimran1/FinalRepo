class Chest{
 ArrayList<Item> thing = new ArrayList();
 int x,y;
 boolean open;
 PImage i;
 Chest(int _x,int _y,Item e){
    i = loadImage("chest1.PNG");  
    x = _x;
    y = _y;
    thing.add(e);
 }
 
  void getItem(Link fg){
   i = loadImage("chest2.PNG");
   open = true;
   if (thing.size() > 0){
     thing.get(0).display();
   }
 }
 
 void display(){
   imageMode(CENTER);
  image(i, x,y,25,25); 
  if (open){
   thing.get(0).display();
  }
  if (thing.get(0).taken){
     thing.remove(thing.get(0)); 
  }
 }
 
}
