class Link{
  float x,y,vx,vy;
  float frontLeftX,frontLeftY,frontRightX, FrontRightY; 
  float Dwidth = 16;
  float Dheight = 22;
  PImage current;
  PImage currentMetaFrame;
  PImage StandDown;
  PImage StandRight;
  PImage StandUp;
  PImage StandLeft;
  int hp,invincibleTime, attackFrame;
  PImage[] currentAttack;
  PImage[] currentMeta;
  PImage[] attackDown;
  PImage[] attackDownMeta;
  PImage[] attackUp;
  PImage[] attackUpMeta;
  PImage[] attackLeft;
  PImage[] attackLeftMeta;
  PImage[] attackRight;
  PImage[] attackRightMeta;
  PImage[] facings;
  
  int facing;
  final int right = 0;
  final int up = 1;
  final int left = 2;
  final int down = 3;
  
  Link(){
   x = 590;
   y = 830;
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
   loadAttack.add("attackUp");
   loadAttack.add("attackLeft");
   loadAttack.add("attackRight");
   for(String directory:loadAttack){
     PImage[] loading = attackDown;
     if(directory == "attackDown"){
       attackDown = new PImage[7];
       loading = attackDown;
     }
     if(directory == "attackUp"){
       attackUp = new PImage[7];
       loading = attackUp;
     }
     if(directory == "attackLeft"){
       attackLeft = new PImage[7];
       loading = attackLeft;
     }
     if(directory == "attackRight"){
       attackRight = new PImage[7];
       loading = attackRight;
     }
     for(int x = 0; x < 7; x++){
       loading[x] = loadImage("SwordAnimation/"+directory+"/"+x+".png");
     }
   }
   
   
   ArrayList<String> loadMeta = new ArrayList(4);
   loadMeta.add("attackDownMeta");
   loadMeta.add("attackUpMeta");
   loadMeta.add("attackLeftMeta");
   loadMeta.add("attackRightMeta");
   for(String directory:loadMeta){
     PImage[] loading = attackDownMeta;
     if(directory == "attackDownMeta"){
       attackDownMeta = new PImage[7];
       loading = attackDownMeta;
     }
     if(directory == "attackUpMeta"){
       attackUpMeta = new PImage[7];
       loading = attackUpMeta;
     }
     if(directory == "attackLeftMeta"){
       attackLeftMeta = new PImage[7];
       loading = attackLeftMeta;
     }
     if(directory == "attackRightMeta"){
       attackRightMeta = new PImage[7];
       loading = attackRightMeta;
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
      currentMetaFrame = currentMeta[attackFrame/2];
      }catch(Exception e){
       println(e); 
      }
      attackFrame++;
      if(attackFrame >= 14){
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
    //rect(x,y,Dwidth,Dheight);
    imageMode(CORNER);
    if(attackFrame >= 0){
      if(facing == down)
      image(current,x,y);
      
      else if(facing == up){
        imageMode(CORNERS);
        image(current,getRightX(),getLowY(),getRightX()-current.width, getLowY()-current.height);
      }
      else if(facing == left){
       imageMode(CORNERS);
       image(current,getRightX(),getY(),getRightX()-current.width,getY()+current.height);
      }
      else{
   image(current,x,y); 
    }
    }
    else{
   image(current,x,y); 
    }
  }
  
  void attack(){
    if(attackFrame == -1){
    attackFrame = 0;
    if(facing == down){
      currentAttack = attackDown; 
      currentMeta = attackDownMeta;
    }
    if(facing == up){
      currentAttack = attackUp;
      currentMeta = attackUpMeta;
    }
    if(facing == left){
      currentAttack = attackLeft;
      currentMeta = attackLeftMeta;
    }
    if(facing == right){
      currentAttack = attackRight;
      currentMeta = attackRightMeta;
    }
    }
  }
  
  void metaDisplay(){
    try{
    imageMode(CORNER);
    if(attackFrame >= 0){
      if(facing == down||facing == right)
      image(currentMetaFrame,x,y);
      
      else if(facing == up){
        imageMode(CORNERS);
        image(currentMetaFrame,getRightX(),getLowY(),getRightX()-current.width, getLowY()-current.height);
      }
      else if(facing == left){
       imageMode(CORNERS);
       image(currentMetaFrame,getRightX(),getY(),getRightX()-current.width,getY()+current.height);
      }
  }
  }
  catch(NullPointerException e){
    println(attackFrame);
  }
  }
}
