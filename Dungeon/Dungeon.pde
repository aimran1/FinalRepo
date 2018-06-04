Link Player;
Screen s;
boolean clickO;
float[] param1;
//Enemy test;
//Location[] dL;
public void setup() {
  size(1200, 873);
  Player = new Link();
  s = new Screen(false);
  //test = new Enemy();
  //dL = new Location[1];
  //dL[0] = new Location(70,40,29.9,19.9);
}
public void draw() {
  background(255);
  fill(0);
  s.display();
  s.update(Player);
  Player.update();
  //test.update(Player);
  //for(int x = 0; x < dL.length;x++){
  //  dL[x].playerCollision(Player);
  //}
  image(s.map(),0,0);
  Player.display();

  s.coolDisplay();
  //test.display();
  text(Player.hp, 100, 100);
}

public void keyPressed(){
 Player.moveInput(key); 
}

public void keyReleased(){
  Player.unInput(key); 
}

public void mouseClicked(){
 //println(""+ mouseX+ ", " + mouseY); 
 if(clickO){
  System.out.println("Location("+param1[0]+","+param1[1]+","+(mouseX-param1[0])+","+(mouseY-param1[1])+",' ')"); 
  clickO = false;
 }
 else{
  param1 = new float[2];
  param1[0] = mouseX;
  param1[1] = mouseY;
  clickO=true;
 }
}
