Link Player;
public void setup() {
  size(600, 300);
  Player = new Link();
}
public void draw() {
  background(255);
  fill(0);
  Player.update();
  Player.display();
}

public void keyPressed(){
 Player.moveInput(key); 
}

public void keyReleased(){
  Player.unInput(key); 
}
