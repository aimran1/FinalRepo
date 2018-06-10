import java.io.*;
PImage screen1;
class Room1 extends Screen{
 Location[] elements; 
 Location[] gates;
 Enemy[] enemies;
 ArrayList<Enemy> LivingBad;
 Room1(int i){
  elements = new Location[2];
  elements[0] = new Location(198.0,84.0,25.0,-80.0,' ',0);
  elements[1] = new Location(198.0,116.0,23.0,88.0,' ',0);


  gates = new Location[1];
  gates[0] = new Location(199.0,96.0,13.0,20.0,' ',color(0,0,255));
  if(i == 0){
    screen1 = loadImage("room1.PNG");
  }
  else if (i == 1){
     screen1 = loadImage("room2.PNG");
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
   return (screen1);
 }
}
