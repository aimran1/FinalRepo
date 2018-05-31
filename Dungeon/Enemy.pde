class Enemy{
  float x,y,vx,vy;
  int steps;
  boolean turn;
  float Dwidth = 16;
  float Dheight = 22;
  PImage current;
  Enemy(){
   x = width/2;
   y = height/2;
   current = loadImage("hinox-sprite.png");
   current.resize(20,25);
   vx = 1;
   vy = 0;
   steps = 0;
   turn = false;
  }
  
  void update(){
    if (turn){
      x -= vx;
      y -= vy;
      steps += 1;
    } else {
      x += vx;
      y += vy;
      steps += 1;
    }
    if (steps == 250){
      steps = 0;
       turn = !turn; 
    }
  }
  
  void pursue(){
    
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
   return y; 
  }
  
  float getLowY(){
   return y + Dheight; 
  }
  
  float getRightX(){
   return x + Dwidth; 
  }
  
  void display(){
   image(current,x,y); 
  }
  
}
