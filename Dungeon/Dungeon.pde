Link Player;
Location[] dL;
public void setup() {
  size(600, 300);
  Player = new Link();
  dL = new Location[1];
  dL[0] = new Location(70,40,30,20);
}
public void draw() {
  background(255);
  fill(0);
  Player.update();
  for(int x = 0; x < dL.length;x++){
    dL[x].playerCollision(Player);
  }
  for(int x = 0; x < dL.length;x++){
    dL[x].display();
  }
  Player.display();
  text(frameRate, 100, 100);
}

public void keyPressed(){
 Player.moveInput(key); 
}

public void keyReleased(){
  Player.unInput(key); 
}
