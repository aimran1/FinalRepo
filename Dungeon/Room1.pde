import java.io.*;
PImage screen1;
int place;
boolean done = false;
Chest c;

class Room1 extends Screen{
 Location[] elements; 
 Location[] gates;
 Enemy[] enemies;
 ArrayList<Enemy> LivingBad;
 Room1(int room){
 place = room;
  LivingBad = new ArrayList();
  if (room == 0){
    elements = new Location[6];
    elements[0] = new Location(198.0,84.0,25.0,-80.0,' ',0);
    elements[1] = new Location(198.0,116.0,23.0,88.0,' ',0);
    elements[2] = new Location(220.0,120.0,2.0,-36.0,' ',0);
    elements[3] = new Location(0.0,206.0,222.0,-22.0,' ',0);
    elements[4] = new Location(24.0,182.0,-23.0,-180.0,' ',0);
    elements[5] = new Location(222.0,2.0,-197.0,21.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(197.0,85.0,28.0,32.0,' ',color(0,225,225));
    
    blocks = new Pushable[1];
    blocks[0] = new Pushable(63, 47);
  }
  
  else if (room == 1){
    elements = new Location[6];
    elements[0] = new Location(204.0,92.0,24.0,-91.0,' ',0);
    elements[1] = new Location(204.0,184.0,24.0,-62.0,' ',0);
    elements[2] = new Location(27.0,24.0,202.0,-22.0,' ',0);
    elements[3] = new Location(2.0,212.0,25.0,-188.0,' ',0);
    elements[4] = new Location(27.0,186.0,201.0,26.0,' ',0);
    elements[5] = new Location(229.0,118.0,-3.0,-30.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(197.0,85.0,28.0,32.0,' ',color(0,225,225));
    
  }
  
  else if (room == 2){
    elements = new Location[6];
    elements[0] = new Location(149.0,218.0,456.0,30.0,' ',0);
    elements[1] = new Location(121.0,219.0,-120.0,27.0,' ',0);
    elements[2] = new Location(115.0,247.0,35.0,-1.0,' ',0);
    elements[3] = new Location(235.0,29.0,30.0,215.0,' ',0);
    elements[4] = new Location(31.0,27.0,235.0,-25.0,' ',0);
    elements[5] = new Location(30.0,216.0,-30.0,-215.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(120.0,217.0,28.0,28.0,' ',color(0,225,225)); 
  }
    
  else if (room == 3){
    elements = new Location[7];
    elements[0] = new Location(162.0,257.0,292.0,-22.0,' ',0);
    elements[1] = new Location(611.0,236.0,-124.0,27.0,' ',0);
    elements[2] = new Location(3.0,263.0,124.0,-34.0,' ',0);
    elements[3] = new Location(111.0,253.0,495.0,9.0,' ',0);
    elements[4] = new Location(578.0,34.0,33.0,232.0,' ',0);
    elements[5] = new Location(33.0,31.0,576.0,-29.0,' ',0);
    elements[6] = new Location(2.0,3.0,30.0,228.0,' ',0);

    gates = new Location[2];
    gates[0] = new Location(124.0,256.0,35.0,-30.0,' ',color(0,225,225));
    gates[1] = new Location(444.0,261.0,42.0,-33.0,' ',color(0,225,225));
  }
  
  else if (room == 4){
    elements = new Location[6];
    elements[0] = new Location(147.0,247.0,115.0,-29.0,' ',0);
    elements[1] = new Location(119.0,218.0,-117.0,27.0,' ',0);
    elements[2] = new Location(109.0,246.0,42.0,-4.0,' ',0);
    elements[3] = new Location(237.0,29.0,27.0,215.0,' ',0);
    elements[4] = new Location(1.0,1.0,236.0,28.0,' ',0);
    elements[5] = new Location(29.0,217.0,-28.0,-216.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(116.0,233.0,32.0,-25.0,' ',color(0,225,225)); 
  }
  
   else if (room == 5){
    elements = new Location[6];
    elements[0] = new Location(30.0,113.0,-28.0,-108.0,' ',0);
    elements[1] = new Location(29.0,141.0,-27.0,112.0,' ',0);
    elements[2] = new Location(9.0,143.0,-6.0,-44.0,' ',0);
    elements[3] = new Location(275.0,253.0,-242.0,-28.0,' ',0);
    elements[4] = new Location(243.0,32.0,32.0,221.0,' ',0);
    elements[5] = new Location(32.0,31.0,243.0,-30.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(6.0,146.0,25.0,-37.0,' ',color(0,225,225)); 
  }
  
  else if(room == 6){
    elements = new Location[6];
    elements[0] = new Location(303.0,38.0,-302.0,-36.0,' ',0);
    elements[1] = new Location(338.0,316.0,-35.0,-278.0,' ',0);
    elements[2] = new Location(39.0,39.0,110.0,-30.0,' ',0);
    elements[3] = new Location(38.0,275.0,-36.0,-272.0,' ',0);
    elements[4] = new Location(341.0,5.0,-154.0,43.0,' ',0);
    elements[5] = new Location(314.0,708.0,0.0,0.0,' ',0);

    gates = new Location[1];
    gates[0] = new Location(145.0,65.0,53.0,-58.0,' ',color(125, 0, 125)); 
  }

  else if(room == 7){
    elements = new Location[4];
    elements[0] = new Location(30.0,513.0,235.0,32.0,' ',0);
    elements[1] = new Location(265.0,545.0,-31.0,-514.0,' ',0);
    elements[2] = new Location(234.0,31.0,-231.0,-28.0,' ',0);
    elements[3] = new Location(3.0,3.0,26.0,511.0,' ',0);
   
    gates = new Location[0];
  }

}

 void update(Link l){
   for(int x = 0; x < LivingBad.size(); x++){
    LivingBad.get(x).update(l);
    if(LivingBad.get(x).getHP()<=0){
      LivingBad.remove(x);
    }
    
  }
  if (LivingBad.size() == 0){
     done = true; 
  }
  
  for(int x = 0; x < blocks.length;x++){
    blocks[x].update(l);
   }
}

 void display(){
  for(int x = 0; x < gates.length;x++){
    gates[x].display();
  } 

   for(int x = 0; x < elements.length;x++){
    elements[x].display();
   }
   
   for(int x = 0; x < blocks.length;x++){
    blocks[x].metaDisplay();
   }
 }
 
 void coolDisplay(){
  for(Enemy bad: LivingBad){
    bad.display();
  }
  
  for(int x = 0; x < blocks.length;x++){
    blocks[x].display();
   }
 }
 
 
 PImage map(){
   if (place < 7){
     screen1 = loadImage("room" + (place + 1)  + ".PNG");
   }
   if (place == 7){
      screen1 =  loadImage("finalRoom.PNG");
   }
   return (screen1);
 }
 
 boolean isScreen(){
    return false; 
 }
   
  boolean isStart(){
   return false; 
  }
}
