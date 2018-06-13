class Pushable{
 PImage block;
 float x,y,Dwidth,Dheight,solveY;
 int direction;
 boolean solved = false;
  Pushable(float X, float Y){
    x = X;
    y = Y;
    block = loadImage("Pushable.png");
    Dheight = block.height;
    solveY = y - Dheight;
    Dwidth = block.width;
  }
  
  void display(){
    image(block,x,y);
  }
  
  void metaDisplay(){
    if(solved){
      fill(0);
      rect(x,y,Dwidth,Dheight);
    }
  }
  
  boolean solved(){
   return solved; 
  }
  
  void update(Link l){
    if(!solved){
    for(int f = (int)x; f < x+Dwidth; f++){
      if(  (inBet(x,l.getX(),l.getRightX())||inBet(x+Dwidth,l.getX(),l.getRightX())) && (inBet(y,l.getY(),l.getLowY())||inBet(y+Dheight,l.getY(),l.getLowY())) ){
        y--;
        l.y++;
      }
    }
    }
    if(y<=solveY){
      solved = true;
    }
  }

  
  boolean inBet(float value, float f, float g){
    return value >= f && value <= g;
  }
}
