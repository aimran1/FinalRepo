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
  System.out.println(x + " " + y);
    checkWalls();

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

public void checkWalls(){
  if (x < 0){
     x = 0; 
  } else if (x > width - 50){
     x = width - 50; 
  } else if (y > height - 50){
     y = height - 50;
  } else if (y < 0){
     y = 0; 
  }
}
