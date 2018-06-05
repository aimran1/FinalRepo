import java.io.*;
PImage screen;
class Screen{
 Location[] elements; 
 Enemy[] enemies;
 ArrayList<Enemy> LivingBad;
 Screen(boolean f){ 
  elements = new Location[32];
  
  elements[0] = new Location(483.0,88.0,230.0,78.0,' ',0);
  elements[1] = new Location(394.0,223.0,98.0,154.0,' ',0);
  elements[2] = new Location(474.0,167.0,15.0,55.0,' ',0);
  elements[3] = new Location(705.0,166.0,17.0,57.0,' ',0);
  elements[4] = new Location(704.0,222.0,98.0,157.0,' ',0);
  elements[5] = new Location(772.0,89.0,86.0,97.0,' ',0);
  elements[6] = new Location(857.0,379.0,98.0,-290.0,' ',0);
  elements[7] = new Location(1033.0,223.0,-78.0,299.0,' ',0);
  elements[8] = new Location(1033.0,435.0,87.0,88.0,' ',0);
  elements[9] = new Location(723.0,531.0,135.0,-97.0,' ',0);
  elements[10] = new Location(780.0,667.0,78.0,-232.0,' ',0);
  elements[11] = new Location(781.0,667.0,213.0,-78.0,' ',0);
  elements[12] = new Location(994.0,589.0,-136.0,251.0,' ',0);
  elements[13] = new Location(1050.0,578.0,81.0,166.0,' ',0);
  elements[14] = new Location(1090.0,223.0,78.0,117.0,' ',0);
  elements[15] = new Location(425.0,186.0,-1.0,-1.0,' ',0);
  elements[16] = new Location(275.0,143.0,39.0,85.0,' ',0);
  elements[17] = new Location(240.0,88.0,185.0,99.0,' ',0);
  elements[18] = new Location(340.0,186.0,-100.0,585.0,' ',0);
  elements[19] = new Location(474.0,434.0,-57.0,100.0,' ',0);
  elements[20] = new Location(339.0,435.0,78.0,233.0,' ',0);
  elements[21] = new Location(87.0,772.0,252.0,68.0,' ',0);
  elements[22] = new Location(87.0,617.0,97.0,99.0,' ',0);
  elements[23] = new Location(87.0,464.0,98.0,98.0,' ',0);
  elements[24] = new Location(87.0,407.0,98.0,-183.0,' ',0);
  elements[25] = new Location(185.0,224.0,-154.0,117.0,' ',0);
  elements[26] = new Location(1089.0,222.0,78.0,118.0,' ',0);
  elements[27] = new Location(1193.0,866.0,-1187.0,-4.0,' ',0);
  elements[28] = new Location(0.0,0.0,1193.0,7.0,' ',0);
  elements[29] = new Location(0.0,2.0,8.0,867.0,' ',0);
  elements[30] = new Location(1198.0,2.0,-11.0,865.0,' ',0);
  elements[31] = new Location(341.0,771.0,-4.0,68.0,' ',0);;
  elements[32] = new Location(5.0,863.0,26.0,-831.0,' ',0);
  elements[33] = new Location(576.0,833.0,-571.0,30.0,' ',0);
  elements[34] = new Location(1193.0,865.0,-573.0,-28.0,' ',0);
  elements[35] = new Location(1166.0,32.0,27.0,833.0,' ',0);
  elements[36] = new Location(3.0,6.0,1163.0,25.0,' ',0);







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
