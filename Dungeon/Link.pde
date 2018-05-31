class Link{
  float x,y,vx,vy;
  float Dwidth = 16;
  float Dheight = 22;
  PImage current;
  PImage StandDown;
  PImage StandRight;
  PImage StandUp;
  PImage StandLeft;
  Link(){
   x = width/2;
   y = height/2;
   StandDown = loadImage("StandingLink.png");
   StandRight = loadImage("StandingRight.png");
   StandUp = loadImage("StandingUp.png");
   StandLeft = loadImage("StandingLeft.png");
   current = StandDown;
  }
  
  void moveInput(char f){
    if(f == 'd'){
      vx = 5;
      current = StandRight;
    }
    if(f == 'w'){
      vy = -5;
      current = StandUp;
    }
    if(f == 'a'){
      vx = -5;
      current = StandLeft;
    }
    if(f == 's'){
      vy = 5;
      current = StandDown;
    }
  }
  
  void unInput(char f){
    if(f == 'd' && vx == 5){
      vx = 0;
    }
    if(f == 'w' && vy == -5){
      vy = 0;
    }
    if(f == 'a' && vx == -5){
      vx = 0;
    }
    if(f == 's' && vy == 5){
      vy = 0;
    }
  }
  
  void update(){
    x+=vx;
    y+=vy;
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
    //rect(x,y,Dwidth,Dheight);
   image(current,x,y); 
  }
  
}
