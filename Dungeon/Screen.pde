import java.io.*;
PImage screen;
class Screen{
 Location[] elements; 
 Enemy[] enemies;
 ArrayList<Enemy> LivingBad;
 Screen(boolean f){ 
  elements = new Location[5];
  elements[0] = new Location(70,40,30,20);
  elements[1] = new Location(340.0,435.0,135.0,99.0,' ');
  elements[2] = new Location(240.0,88.0,100.0,752.0,' ');
  elements[3] = new Location(241.0,91.0,184.0,97.0,' ');
  elements[4] = new Location(394.0,224.0,99.0,153.0,' ')
; 
  enemies=new Enemy[10];
  enemies[0] = new Enemy();
  LivingBad = new ArrayList<Enemy>();
  LivingBad.add(new Enemy());
  screen = loadImage("Start.PNG");
 }
 

 void update(Link l){
   for(int x = 0; x < LivingBad.size(); x++){
    LivingBad.get(x).update(l);
    if(LivingBad.get(x).getHP()<=0){
      LivingBad.remove(x);
    }
  }
}

 
 void display(){
   for(int x = 0; x < elements.length;x++){
    elements[x].display();
  }
 }
 
 void coolDisplay(){
  for(Enemy bad: LivingBad){
    bad.display();
  } 
 }
 
 PImage map(){
   return screen;
 }
}
