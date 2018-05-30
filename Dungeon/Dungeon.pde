float x = 400.0;
float y = 400.0;
PImage img;

public void setup() {
  size(900, 800);
  background(255);  
  noStroke(); 

// Bright red
  fill(255,0,150);
  img = loadImage("link.png");
}


public void draw() {
  background(255);
  System.out.println(x + " " + y);
  checkWalls();
  image(img, x, y, img.width/6, img.height/6);
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
  } else if (x > width - img.width/6){
     x = width - img.width/6; 
  } else if (y > height - img.height/6){
     y = height - img.height/6;
  } else if (y < 0){
     y = 0; 
  }
}
