import java.io.*;
PImage screen;
class Screen{
 Location[] elements; 
 Enemy[] enemies;
 ArrayList<Enemy> LivingBad;
 Screen(boolean f){ 
  elements = new Location[11];
  elements[0] = new Location(340.0,435.0,135.0,99.0,' ');
  elements[1] = new Location(240.0,88.0,100.0,752.0,' ');
  elements[2] = new Location(241.0,91.0,184.0,97.0,' ');
  elements[3] = new Location(394.0,224.0,99.0,153.0,' ');
  elements[4] = new Location(417.0,667.0,-112.0,-163.0,' ');
  elements[5] = new Location(87.0,772.0,227.0,98.0,' '); 
  elements[6] = new Location(474.0,223.0,17.0,-56.0,' '); 
  elements[7] = new Location(483.0,166.0,232.0,-78.0,' '); 
  elements[8] = new Location(705.0,166.0,18.0,57.0,' '); 
  elements[9] = new Location(703.0,223.0,100.0,157.0,' ');
  
  enemies=new Enemy[2];
  enemies[0] = new Enemy();
  enemies[1] = new Enemy(12,17,"hinox-sprite.png");
  LivingBad = new ArrayList<Enemy>();
  for(int x = 0; x < enemies.length; x++){
    LivingBad.add(enemies[x]);
  }
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
