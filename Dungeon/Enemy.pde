class Enemy extends Attack{
  float x,y,vx,vy;
  int steps;
  boolean turn;
  float Dwidth = 16;
  float Dheight = 22;
  float speed, angle;
  PImage current;
  PVector myPos, target, player;
  int hp;
  Enemy(){
   x = width/2;
   y = height/2;
   current = loadImage("hinox-sprite.png");
   current.resize(20,25);
   vx = 1;
   vy = 0;
  // myPoa = new PVector(getX(), getY());
   speed = 3;
   steps = 0;
   turn = false;
   hp = 20;
  }
  
  void update(Link fg){
    target = new PVector(fg.getX()-getX(), fg.getY()- getY());
    if (sqrt(pow(target.x,2)+pow(target.y,2)) < 100){
      target.normalize();
      target.x *= speed;
      target.y *= speed;
      x += target.x;
      y += target.y;
    } 
    else {
      if (turn){
        x -= vx;
        y -= vy;
        steps += 1;
      } else {
        x += vx;
        y += vy;
        steps += 1;
      }
      if (steps == 200){
        steps = 0;
         turn = !turn; 
      }
    }
    playerCollision(fg);
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
  
  void hurt(int dam){
    hp-=dam;
  }
  
  int getHP(){
    return hp;
  }
  
  void playerCollision(Link G){
   if((inBet(G.getY(),y,y+Dheight)||inBet(G.getLowY(),y,y+Dheight)) && (inBet(G.getX(),x,x+Dwidth)||inBet(G.getRightX(),x,x+Dwidth))){
     G.hurt(4);
   }
  }
  
  boolean inBet(float value, float f, float g){
    return value >= f && value <= g;
  }
}
