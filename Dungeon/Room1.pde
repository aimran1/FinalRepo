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
  
  else if (room == 2){
    elements = new Location[2];
    elements[0] = new Location(149.0,218.0,456.0,30.0,' ',0);
    elements[1] = new Location(121.0,219.0,-120.0,27.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(120.0,217.0,28.0,28.0,' ',color(0,225,225)); 
  }
  
  else if (room == 4){
    elements = new Location[3];
    elements[0] = new Location(147.0,247.0,115.0,-29.0,' ',0);
    elements[1] = new Location(119.0,218.0,-117.0,27.0,' ',0);
    elements[2] = new Location(109.0,246.0,42.0,-4.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(116.0,233.0,32.0,-25.0,' ',color(0,225,225)); 
  }
  
   else if (room == 5){
    elements = new Location[3];
    elements[0] = new Location(30.0,113.0,-28.0,-108.0,' ',0);
    elements[1] = new Location(29.0,141.0,-27.0,112.0,' ',0);
    elements[2] = new Location(9.0,143.0,-6.0,-44.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(6.0,146.0,25.0,-37.0,' ',color(0,225,225)); 
  }
  
  else if (room == 3){
   elements = new Location[1];
    elements[0] = new Location(32.0,231.0,93.0,26.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(126.0,255.0,32.0,-24.0,' ',color(0,255,255));

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
 
 void reenter(){
   
 }
 
 void solved(){
   
 }
 
 PImage map(){
   screen1 = loadImage("room" + (place + 1)  + ".PNG");
   return (screen1);
 }
 
 boolean isScreen(){
    return false; 
 }
}
