class pushable{
 PImage block;
 float x,y,Dwidth,Dheight;
 int direction;
  pushable(float X, float Y){
    x = X;
    y = Y;
    block = loadImage("pushable.png");
  }
  
  void display(){
    image(block,x,y);
  }
  
  void update(){
    
  }
}
