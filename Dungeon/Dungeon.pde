Link Player;
Screen s;
Screen[] rooms;
int currentScreen;
boolean clickO;
color gates = color(0,0,225);
float[] param1;
ArrayList<Location> tests;
Attack continuous;
public void setup() {
  size(1200, 873);
  imageMode(CENTER);
  Player = new Link();
  s = new Screen();
  
  //test code
  tests = new ArrayList();
}
public void draw() {
  background(255);
  Player.metaDisplay();
  s.pain(Player);
  fill(0);

  
  s.display();
    
  if (get((int)Player.x,(int)Player.y) == gates){
     s = new Room1();
     Player.x = width/2;
     Player.y = height/2;
  }
  //test code
  for(Location jerr: tests){
    jerr.display();
  }
  
  
  s.update(Player);
  Player.update();
  image(s.map(),(width-s.map().width)/2,(height/-s.map().height));
  Player.display();

  s.coolDisplay();
  text(Player.hp, 100, 100);

}

public void keyPressed(){
 Player.moveInput(key); 
 if(key == TAB){
 s = new Screen();
 Player = new Link();
 }
 /*
 if (key == 'j'){
   
   Player.attack();
   
   for(Enemy e:s.enemies){
     if (dist(Player.getX(),Player.getY(),e.getX(),e.getY())<= 10 && 
       e.getY() < Player.getY()){
       e.hurt(4);
     }
   }
 }
 */
}

public void keyReleased(){
  Player.unInput(key); 
}

public void mouseClicked(){
 /* System.out.println(mouseX + " " + mouseY);
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
 }*/
 
}
