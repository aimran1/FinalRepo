Link Player;
Screen s;
Screen previous = s;
float prevX,prevY;
int currentScreen;
boolean clickO;
color gates = color(0,0,225);
color retGate = color (0,225,225);
float[] param1;
ArrayList<Location> tests;
Chest m;
Attack continuous;
public void setup() {
  size(1200, 873);
  imageMode(CENTER);
  Player = new Link();
  //s = new Screen();
 
 //For map making
  s = new Room1(3);
  Player.x = 112;
  Player.y = 101;
  
  //  m = new Chest(width/2, height/2);

  //test code
  tests = new ArrayList();
}
public void draw() {
  //pushMatrix();
  //translate(-Player.getX(),-Player.getY());
  //scale(2.0);
  background(255);
  Player.metaDisplay();
  s.pain(Player);
  fill(0);
  s.display();
 
  //test code
  for(Location jerr: tests){
    jerr.display();
  } 

  s.update(Player);
  Player.update();
  imageMode(CENTER);
  surface.setSize(s.map().width,s.map().height);
  image(s.map(),width/2,height/2);
  imageMode(CORNER);
 // m.display();

  Player.display();
  
  fill(255,0,0);
  for(int health = 0; health <= Player.getHP(); health++){
    rect(20+health*4,20,4,10);
  }
  fill(0);
  s.coolDisplay();
  text(Player.hp, 100, 100);
  //popMatrix();
  
  if (s.isScreen()){
     previous = s; 
     prevX = Player.x;
     prevY = Player.y;
  }
}

public void keyPressed(){
Player.moveInput(key); 
/* if(key == TAB){
 s = rooms[0];
 Player = new Link();
 }
 if(key == ENTER)
 tests.remove(tests.size()-1);*/
 if(key == 'e'){
   door();
 }
  if(key == 'q' && dist(Player.x,Player.y,m.x,m.y) <= 15){
          m.getItem();
          m.display();
  }
}

public void door(){
  s.display();
  if (get((int)Player.x,(int)Player.y) == retGate){
    if (s.place == 3){
      if (Player.x <width/2){
      prevX = 440;
      prevY = 15;
      }
      else{
         prevX = 745; prevY = 15; 
      }
    }
    s = previous;
    Player.x = prevX;
    Player.y = prevY;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < height/2 && Player.y > height/2){
     s = new Room1(0);
     Player.x = 200;
     Player.y = 90;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < 118 && Player.y < 161){
     s = new Room1(1);
     Player.x = 210;
     Player.y = 90;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < 181 && Player.y < 92){
     s = new Room1(2);
     Player.x = 125;
     Player.y = 225;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < 540 && Player.x > 400 && Player.y < 92){
     s = new Room1(3);
     Player.x = 135;
     Player.y = 225;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < 860 && Player.x > 640 && Player.y < 92){
     s = new Room1(3);
     Player.x = 460;
     Player.y = 230;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x > 1000 && Player.y < 92){
     s = new Room1(4);
     Player.x = 125;
     Player.y = 215;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x > width/2 && Player.y > height/2){
     s = new Room1(5);
     Player.x = 20;
     Player.y = 115;
  }
}

public void keyReleased(){
  Player.unInput(key); 
}

public void mouseClicked(){
 System.out.println(mouseX + " " + mouseY);
 if(clickO){
  System.out.println("elements[] = new Location("+param1[0]+","+param1[1]+","+(mouseX-param1[0])+","+(mouseY-param1[1])+",' ',0)"); 
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
