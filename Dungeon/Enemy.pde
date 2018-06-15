class Enemy extends Attack{
  float x,y,vx,vy;
  int steps;
  boolean turn;
  float Dwidth = 16;
  float Dheight = 22;
  float speed, angle;
  PImage current;
  PVector myPos, target, player;
  int hp,invincibleFrame;
  int range;

  Enemy(){
   x = width/2;
   y = height/2;
   current = loadImage("hinox-sprite.png");
   current.resize(20,25);
   vx = 2;
   vy = 0;
  // myPoa = new PVector(getX(), getY());
   speed = 2.5;
   steps = 0;
   turn = false;
   hp = 20;
      range =100;

  }
  
  Enemy(float X, float Y, String Image){
   x = X;
   y = Y;
   current = loadImage(Image);
   current.resize(20,25);
   vx = 2;
   vy = 0;
  // myPoa = new PVector(getX(), getY());
   speed = 2.5;
   steps = 0;
   turn = false;
   hp = 20;
   range =100;
  }
  
  Enemy(float X, float Y, int r, int m){
   x = X;
   y = Y;
   current = loadImage("boss.png");
   current.resize(r,m);
   vx = 2;
   vy = 0;
  // myPoa = new PVector(getX(), getY());
   speed = 2.5;
   steps = 0;
   turn = false;
   hp = 35;
   range = 1000;
  }
  
  void update(Link fg){
    target = new PVector(fg.getX()-getX(), fg.getY()- getY());
    
      float temp = vx;
      float tempy = vy;
    if (sqrt(pow(target.x,2)+pow(target.y,2)) < range){
      target.normalize();
      target.x *= speed;
      target.y *= speed;
      vx = target.x;
      vy = target.y;
      if(walkableX())
        x += vx;
      if(walkableY())
        y += vy;
        
        
      vx = temp;
      vy = tempy;
    } 
    else {
      if (turn){
        vx*=-1;
        vy*=-1;
        
        if(walkableX())
        x += vx;
        if(walkableY())
        y += vy;
        
        vx*=-1;
        vy*=-1;
        steps += 1;
      } else {
        if(walkableX())
        x += vx;
        if(walkableY())
        y += vy;
        steps += 1;
      }
   /*   if (!walkableX() && !walkableY()){
        steps = 200;
      }*/
      if (steps == 100){
        steps = 0;
        turn = !turn; 
      } 
    }
    playerCollision(fg);
    if(invincibleFrame > 0){
      invincibleFrame--;
    }
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
  
  void hurt(int dam, Link s){
    if(invincibleFrame <=0){
    hp-=dam;
    invincibleFrame = 14;
    if(s.facing == s.up){
      float dy = 0;
      while(walkableY(dy-dam)&&dy>-dam*8){
      dy-=dam;
      }
      y+=dy;
    }
    if(s.facing == s.down){
      y+=dam*9;
    }
    if(s.facing == s.left){
      x-=dam*9;
    }
    if(s.facing == s.right){
      x+=dam*9;
    }
    }
  }
  
  
  void hurt(int dam){
    if(invincibleFrame <=0){
    hp-=dam;
    invincibleFrame = 14;
    
    }
  }
  
  void pain(Link s){
    for(int X = (int)x; X <= x+Dwidth; X+=2){
      for(int Y = (int)y; Y <= y+Dheight; Y+=2){
        if(get(X,Y) == color(127,127,127)){
          hurt(4,s);
        }
      }
    }
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
  
    boolean walkableX(){
    return get((int)(x+vx),(int)(y))!=color(0) && get((int)(x+Dwidth+vx),(int)(y))!=color(0) && get((int)(x+vx),(int)(y+Dheight))!=color(0) && get((int)(x+Dwidth+vx),(int)(y+Dheight))!=color(0);
  }
  
   boolean walkableX(float dx){
    return get((int)(x+dx),(int)(y))!=color(0) && get((int)(x+Dwidth+dx),(int)(y))!=color(0) && get((int)(x+dx),(int)(y+Dheight))!=color(0) && get((int)(x+Dwidth+dx),(int)(y+Dheight))!=color(0);
  }
  
  boolean walkableY(){
    return get((int)(x),(int)(y+vy))!=color(0) && get((int)(x+Dwidth),(int)(y+vy))!=color(0) && get((int)(x),(int)(y+Dheight+vy))!=color(0) && get((int)(x+Dwidth),(int)(y+Dheight+vy))!=color(0);
  }
  
  boolean walkableY(float dy){
    return get((int)(x),(int)(y+dy))!=color(0) && get((int)(x+Dwidth),(int)(y+dy))!=color(0) && get((int)(x),(int)(y+Dheight+dy))!=color(0) && get((int)(x+Dwidth),(int)(y+Dheight+dy))!=color(0);
  }
  
}
