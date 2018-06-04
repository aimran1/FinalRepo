Link Player;
Screen s;
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
}

public void keyReleased(){
  Player.unInput(key); 
}

public void mouseClicked(){
 if(clickO){
  System.out.println("elements[] = new Location("+param1[0]+","+param1[1]+","+(mouseX-param1[0])+","+(mouseY-param1[1])+",' ')"); 
  tests.add(new Location(param1[0],param1[1],mouseX-param1[0],mouseY-param1[1],' '));
  clickO = false;
 }
 else{
  param1 = new float[2];
  param1[0] = mouseX;
  param1[1] = mouseY;
  clickO=true;
 }
}