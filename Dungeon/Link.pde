class Link{
  float x,y,vx,vy;
  float Dwidth = 16;
  float Dheight = 22;
  PImage current;
  PImage StandDown;
  PImage StandRight;
  PImage StandUp;
  PImage StandLeft;
  int hp,invincibleTime;
  Link(){
   x = width/2-width/2%5;
   y = height/2-width/2%5;
   StandDown = loadImage("StandingLink.png");
   StandRight = loadImage("StandingRight.png");
   StandUp = loadImage("StandingUp.png");
   StandLeft = loadImage("StandingLeft.png");
   current = StandDown;
   hp = 40;
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
    if(get((int)(x+vx),(int)(y))==color(255) && get((int)(x+Dwidth+vx),(int)(y))==color(255) && get((int)(x+vx),(int)(y+Dheight))==color(255) && get((int)(x+Dwidth+vx),(int)(y+Dheight))==color(255)){
      x+=vx;
    }
    if(get((int)(x),(int)(y+vy))==color(255) && get((int)(x+Dwidth),(int)(y+vy))==color(255) && get((int)(x),(int)(y+Dheight+vy))==color(255) && get((int)(x+Dwidth),(int)(y+Dheight+vy))==color(255)){
      y+=vy;
    }
    invincibleTime--;
  }
  
  //trying to go dirctly against wall
    void update2(){
      float vxe = vx;
      float vye = vy;
    while(vxe >= 0 && get((int)(x+vxe),(int)(y))!=color(255) && get((int)(x+Dwidth+vxe),(int)(y))!=color(255) && get((int)(x+vxe),(int)(y+Dheight))!=color(255) && get((int)(x+Dwidth+vxe),(int)(y+Dheight))!=color(255)){
      vxe-=vxe%5;
    }
    x+=vxe;
    while(vye >= 0 && get((int)(x),(int)(y+vye))!=color(255) && get((int)(x+Dwidth),(int)(y+vye))!=color(255) && get((int)(x),(int)(y+Dheight+vye))!=color(255) && get((int)(x+Dwidth),(int)(y+Dheight+vye))!=color(255)){
      vye-=vye%5;
    }
    y+=vye;
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
  
  void hurt(int dam){
   if(!(invincibleTime > 0)){
   hp -= dam;
   invincibleTime = 30;
   }
  }
  
  void display(){
    //rect(x,y,Dwidth,Dheight);
   image(current,x,y); 
  }
  
}