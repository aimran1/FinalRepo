Link Player;
Screen s;
Screen[] rooms;
int currentScreen;
boolean clickO;
float[] param1;
ArrayList<Location> tests;
Attack continuous;
public void setup() {
  size(1200, 873);
  Player = new Link();
  s = new Screen(false);
  
  //test code
  tests = new ArrayList();
}
public void draw() {
  background(255);
  fill(0);
  s.display();
  
  //test code
  for(Location jerr: tests){
    jerr.display();
  }
  
  
  s.update(Player);
  Player.update();
  image(s.map(),0,0);
  Player.display();

  s.coolDisplay();
  text(Player.hp, 100, 100);
}

public void keyPressed(){
 Player.moveInput(key); 
 if(key == TAB){
   tests.remove(tests.size()-1);
 }
 if (key == 'j'){
   Player.attack();
   for(Enemy e:s.enemies){
     if (dist(Player.getX(),Player.getY(),e.getX(),e.getY())<= 30){
       if(Player.getFacing() == 3 && e.getY() <= Player.getY() ||
          Player.getFacing() == 2 && e.getX() <= Player.getX() ||
          Player.getFacing() == 1 && e.getY() >= Player.getY() ||
          Player.getFacing() == 0 && e.getX() >= Player.getX()){
         e.hurt(4);
     }
   }
 }
}
}

public void keyReleased(){
  Player.unInput(key); 
}

public void mouseClicked(){
  System.out.println(mouseX + " " + mouseY);
 if(clickO){
  System.out.println("elements[] = new Location("+param1[0]+","+param1[1]+","+(mouseX-param1[0])+","+(mouseY-param1[1])+",' ')"); 
  tests.add(new Location(param1[0],param1[1],mouseX-param1[0],mouseY-param1[1],' ',0));
  clickO = false;
 }
 else{
  param1 = new float[2];
  param1[0] = mouseX;
  param1[1] = mouseY;
  clickO=true;
 }
}
