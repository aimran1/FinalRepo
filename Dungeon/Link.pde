class Link{
  float x,y,vx,vy;
  float Dwidth = 16;
  float Dheight = 22;
  PImage current;
  PImage StandUp;
  PImage StandRight;
  Link(){
   x = width/2;
   y = height/2;
   StandUp = loadImage("StandingLink.png");
   StandRight = loadImage("StandingRight.png");
   current = StandUp;
  }
  
  void moveInput(char f){
    if(f == 'd'){
      vx = 5;
      current = StandRight;
    }
    if(f == 'w'){
      vy = -5;
    }
    if(f == 'a'){
      vx = -5;
    }
    if(f == 's'){
      vy = 5;
      current = StandUp;
    }
  }
  
  void unInput(char f){
    if(f == 'd'){
      vx = 0;
    }
    if(f == 'w'){
      vy = 0;
    }
    if(f == 'a'){
      vx = 0;
    }
    if(f == 's'){
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