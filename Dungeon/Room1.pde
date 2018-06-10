import java.io.*;
PImage screen1;
int place;
class Room1 extends Screen{
 Location[] elements; 
 Location[] gates;
 Enemy[] enemies;
 ArrayList<Enemy> LivingBad;
 Room1(int room){
  place = room;
  
  if (room <= 1){
    elements = new Location[2];
    elements[0] = new Location(198.0,84.0,25.0,-80.0,' ',0);
    elements[1] = new Location(198.0,116.0,23.0,88.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(197.0,85.0,28.0,32.0,' ',color(0,225,225));
    
    if(place == 0){
    }
    else if (place == 1){
    }
  }
  
  else {
    elements = new Location[2];
    elements[0] = new Location(147.0,218.0,117.0,27.0,' ',0);
    elements[1] = new Location(121.0,219.0,-120.0,27.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(120.0,217.0,28.0,28.0,' ',color(0,225,225)); 
  }
  

}

 void update(Link l){
   /*for(int x = 0; x < LivingBad.size(); x++){
    LivingBad.get(x).update(l);
    if(LivingBad.get(x).getHP()<=0){
      LivingBad.remove(x);
    }
  }*/
}

 void display(){
   for(int x = 0; x < elements.length;x++){
    elements[x].display();
   }

  for(int x = 0; x < gates.length;x++){
    gates[x].display();
  } 

}
 
 void coolDisplay(){
 /* for(Enemy bad: LivingBad){
    bad.display();
  }*/ 
 }
 
 PImage map(){
   screen1 = loadImage("room" + (place + 1)  + ".PNG");
   return (screen1);
 }
 
 boolean isScreen(){
    return false; 
 }
}
