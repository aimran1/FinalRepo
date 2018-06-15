import java.util.*;

Link Player;
Screen s;
Screen previous = s;
float prevX,prevY;
int currentScreen;
int room = 0;
boolean clickO;
color gates = color(0,0,225);
color retGate = color (0,225,225);
color specialGate = color(125,0,125);
float[] param1;
boolean addHealth = false;
ArrayList<Location> tests;
ArrayList<Key> n = new ArrayList();
ArrayList<Potion> f = new ArrayList();
ArrayList<Potion> f2 = new ArrayList();
int[] buttons;
Chest[] chest;
Screen[] rooms;
Attack continuous;

boolean inColor(color c){
   return get((int)(Player.getX()),(int)(Player.getY()))!=color(0) && get((int)(Player.getRightX()),(int)(Player.getY()))==c && get((int)(Player.getX()),(int)(Player.getLowY()))==c || get((int)(Player.getRightX()),(int)(Player.getY()))==c;
 }

public void setup() {
  size(1200, 873);
  imageMode(CENTER);
  surface.setResizable(true);
  Player = new Link();
 /* rooms = new Screen[10];
  rooms[0] = new Screen();
  rooms[1] = new Room1(0);
  rooms[2] = new Room1(1);
  rooms[3] = new Room1(2);
  rooms[4] = new Room1(3);
  rooms[5] = new Room1(4);
  rooms[6] = new Room1(5);
  s = rooms[0];*/
  s = new StartScreen(0);
  buttons = s.getLocs();
   chest = new Chest[2];
   Potion i = new Potion (69,150);
   Potion p = new Potion(310,120);
   chest[0] = new Chest(64,150);
   chest[1] = new Chest(303,120);

  Key m = new Key(218,199);
  n.add(m);
  f.add(i);
  f2.add(p);
  //test code
  tests = new ArrayList();
}


public void draw() {
  //pushMatrix();
  //translate(-Player.getX(),-Player.getY());
  //scale(2.0);
  background(255);
  if (Player.hp <= 0){
    s = previous;
    s = new StartScreen(2);
  }
 if (!s.isStart()){
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
 if (room == 2 ){
   chest[0].display();
   if (f.size() > 0){

   f.get(0).display();
   if (f.get(0).isPotion(Player)){
     addHealth = true;
     f.remove(f.get(0));
   }
   }
   }
 else if (room == 4){
   chest[1].display();
   if (f2.size() > 0){
      f2.get(0).display();
         if(f2.get(0).isPotion(Player)){
            addHealth = true; 
                 f2.remove(f2.get(0));

         }
   }
 }

  Player.display();

//KEY CODE//
if (room == 7){
  for (Iterator<Key> iterator = n.iterator(); iterator.hasNext();) {
    Key k = iterator.next();
    k.display();
    if (k.isKey(Player)) {
        iterator.remove();
        Player.keys += 1;
    }
  }
}

/*if (room == 8){
 if  (get((int)Player.x,(int)Player.y) == gates){
  s = new Room1(7); 
 }
}*/

  fill(255,0,0);
  if (addHealth){
    Player.hp += 10;
    addHealth = false;
  }
  for(int health = 0; health <= Player.getHP(); health++){
    rect(20+health*4,20,4,10);
  }
  fill(0);
  s.coolDisplay();
  text(Player.hp, 100, 100);
  //popMatrix();

println (room + " " + s.done);
    
    if (room == 9 & s.done){
    s = previous;

     s= new StartScreen(1);
  }
  if (s.isScreen()){
     previous = s; 
     prevX = Player.x;
     prevY = Player.y;
    }
       text(s.LivingBad.size(), width -100, height -100);

  }
  

  else {
     s.display(); 
     buttons = s.getLocs();

  }
//  println(Player.keys);
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
  if(key == 'q'){
    for(Chest c:chest){try{
     if (dist(Player.x,Player.y,c.x,c.y) <= 15){
          c.getItem(Player);
          c.display();
      }}catch(NullPointerException e){}
    }
  }
}



public void door(){
  s.display();
  if (get((int)Player.x,(int)Player.y) == retGate){
    room = 0;
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
  else if (get((int)Player.x,(int)Player.y) == specialGate && !s.isScreen()){
      room = 9;
      s = new Room1(7);
      Player.x = 125;
      Player.y = 490;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < height/2 && Player.y > height/2){
     room = 1;
    s = new Room1(0);
     Player.x = 200;
     Player.y = 90;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < 118 && Player.y < 161){
        room = 2;
    s = new Room1(1);
     Player.x = 200;
     Player.y = 95;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < 181 && Player.y < 92){
      room = 3;

    s = new Room1(2);
     Player.x = 125;
     Player.y = 225;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < 540 && Player.x > 400 && Player.y < 92){
    room = 4;
    s = new Room1(3);
     Player.x = 135;
     Player.y = 225;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x < 860 && Player.x > 640 && Player.y < 92){
    room = 5;
    s = new Room1(3);
     Player.x = 460;
     Player.y = 230;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x > 1000 && Player.y < 92){
    room = 6;
    s = new Room1(4);
     Player.x = 125;
     Player.y = 215;
  }
  else if (get((int)Player.x,(int)Player.y) == gates && Player.x > width/2 && Player.y > height/2){
     room = 7;
    s = new Room1(5);
     Player.x = 20;
     Player.y = 115;
  }
  else if (get((int)Player.x,(int)Player.y) == specialGate && Player.keys > 0 && s.isScreen()){
    room = 8;
    Player.keys -= 1;
    s = new Room1(6);
    Player.x = 49;
    Player.y = 163;
  }
  else if (get((int)Player.x,(int)Player.y) == specialGate && !s.isScreen()){
      room = 9;
      s = new Room1(7);
      Player.x = 125;
      Player.y = 490;
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
 
 if (s.isStart()){            
   println(buttons[0] + " " + buttons[1] + " " +buttons[2] + " " +buttons[3]);
println(mouseX + " " + mouseY);
   if (mouseX >=buttons[0] && buttons[1] >= mouseX &&
       mouseY >=buttons[2] && buttons[3] >= mouseY){
         println(":wast");
    s = new Screen();
    Player = new Link();
  }
 }
 
}
