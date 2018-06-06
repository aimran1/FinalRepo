class Link{
  float x,y,vx,vy;
  float frontLeftX,frontLeftY,frontRightX, FrontRightY; 
  float Dwidth = 16;
  float Dheight = 22;
  PImage current;
  PImage StandDown;
  PImage StandRight;
  PImage StandUp;
  PImage StandLeft;
  int hp,invincibleTime, attackFrame;
  PImage[] currentAttack;
  PImage[] attackDown;
  PImage[] facings;
  
  int facing;
  final int right = 0;
  final int up = 1;
  final int left = 2;
  final int down = 3;
  
  Link(){
   x = width/2-width/2%5;
   y = height/2-width/2%5;
   StandDown = loadImage("StandingLink.png");
   StandRight = loadImage("StandingRight.png");
   StandUp = loadImage("StandingUp.png");
   StandLeft = loadImage("StandingLeft.png");
   current = StandDown;
   facing = down;
   facings = new PImage[4];
   facings[left] = StandLeft;
   facings[right] = StandRight;
   facings[up] = StandUp;
   facings[down] = StandDown;
   hp = 40;
   attackFrame = -1;
   ArrayList<String> loadAttack = new ArrayList(4);
   loadAttack.add("attackDown");
   for(String directory:loadAttack){
     PImage[] loading = attackDown;
     if(directory == "attackDown"){
       attackDown = new PImage[7];
       loading = attackDown;
     }
     for(int x = 0; x < 7; x++){
       loading[x] = loadImage("SwordAnimation/"+directory+"/"+x+".png");
     }
   }
  }
  
  void moveInput(char f){
    if(f == 'd'){
      vx = 5;
      current = StandRight;
      facing = right;
    }
    if(f == 'w'){
      vy = -5;
      current = StandUp;
      facing = up;
    }
    if(f == 'a'){
      vx = -5;
      current = StandLeft;
      facing = left;
    }
    if(f == 's'){
      vy = 5;
      current = StandDown;
      facing = down;
    }
    if(f == 'j'){
      attack();
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
  
  boolean walkableX(){
    return get((int)(x+vx),(int)(y))!=color(0) && get((int)(x+Dwidth+vx),(int)(y))!=color(0) && get((int)(x+vx),(int)(y+Dheight))!=color(0) && get((int)(x+Dwidth+vx),(int)(y+Dheight))!=color(0);
  }
  
  boolean walkableY(){
    return get((int)(x),(int)(y+vy))!=color(0) && get((int)(x+Dwidth),(int)(y+vy))!=color(0) && get((int)(x),(int)(y+Dheight+vy))!=color(0) && get((int)(x+Dwidth),(int)(y+Dheight+vy))!=color(0);
  }
  
  void update(){
    if(attackFrame>=0){
      try{
      current = currentAttack[attackFrame/2];
      }catch(Exception e){
       println(""+attackFrame); 
      }
      attackFrame++;
      if(attackFrame > 14){
        attackFrame = -1;
        current = facings[facing];
      }
    }
    else{
    if(walkableX()){
      x+=vx;
    }
    if(walkableY()){
    y+=vy;
    }
    invincibleTime--;
    }
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
   invincibleTime = 120;
   }
  }
  
  void display(){
    rect(x,y,Dwidth,Dheight);
   image(current,x,y); 
  }
  
  void attack(){
    attackFrame = 0;
    if(facing == down){
      currentAttack = attackDown;
    }
  }
  
}
