import java.io.*;
PImage screen1;
class Room1 extends Screen{
 Location[] elements; 
 Location[] gates;
 Enemy[] enemies;
 ArrayList<Enemy> LivingBad;
 Room1(){ 
  elements = new Location[38];
 
  gates = new Location[8];

  screen1 = loadImage("room1.PNG");
    
 }
 

 void update(Link l){
   /*for(int x = 0; x < LivingBad.size(); x++){
    LivingBad.get(x).update(l);
    if(LivingBad.get(x).getHP()<=0){
      LivingBad.remove(x);
    }
  }*/
      text("Coming soon! \n (Press 'Tab'to Escape)",width/2,height/2); 

}

 
 void display(){
   //for(int x = 0; x < elements.length;x++){
   // elements[x].display();
  //}

  //for(int x = 0; x < gates.length;x++){
  //  gates[x].display();
 // } 

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
