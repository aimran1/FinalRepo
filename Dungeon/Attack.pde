class Attack{
  
  float x,y,Dwidth,Dheight;
  boolean isLinks;
  
  void attack(Attackable G, int dam){
    if(isLinks &&  !(G instanceof Link)){
      if((inBet(G.getY(),y,y+Dheight)||inBet(G.getLowY(),y,y+Dheight)) && (inBet(G.getX(),x,x+Dwidth)||inBet(G.getRightX(),x,x+Dwidth))){
        G.hurt(dam);
      }
      if(!isLinks && G instanceof Link){
        if((inBet(G.getY(),y,y+Dheight)||inBet(G.getLowY(),y,y+Dheight)) && (inBet(G.getX(),x,x+Dwidth)||inBet(G.getRightX(),x,x+Dwidth))){
          G.hurt(dam);
        }
      }
    }
  }
  
  void playerCollision(Link G, int dam){
   if((inBet(G.getY(),y,y+Dheight)||inBet(G.getLowY(),y,y+Dheight)) && (inBet(G.getX(),x,x+Dwidth)||inBet(G.getRightX(),x,x+Dwidth))){
     G.hurt(4);
   }
  }
  
  void enemyCollision(Enemy F){
    if((inBet(F.getY(),y,y+Dheight)||inBet(F.getLowY(),y,y+Dheight)) && (inBet(F.getX(),x,x+Dwidth)||inBet(F.getRightX(),x,x+Dwidth))){
     F.hurt(4);
   }
  }
  
  boolean inBet(float value, float f, float g){
    return value >= f && value <= g;
  }
  
}
