import java.io.*;
class Screen{
 Location[] elements; 
 Enemy[] enemies;
 ArrayList<Enemy> LivingBad;
 Screen(boolean f){ 
  elements = new Location[1];
  elements[0] = new Location(70,40,30,20);
  enemies=new Enemy[10];
  enemies[0] = new Enemy();
  LivingBad = new ArrayList<Enemy>();
  LivingBad.add(new Enemy());
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
}
