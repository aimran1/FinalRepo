float x = 400.0;
float y = 400.0;

public void setup() {
  size(900, 800);
  background(255);  
  noStroke(); 

// Bright red
  fill(255,0,150);
  rect(x,y,50,50);
}


public void draw() {
  background(255);
  rect(x,y,50,50);
}

public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y -= 5;
    } else if (keyCode == DOWN) {
      y += 5;
    } else if (keyCode == LEFT) {
      x -= 5;
    } else if (keyCode == RIGHT) {
      x += 5; 
    }
  }
}
