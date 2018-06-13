class Pushable{
 PImage block;
 float x,y,Dwidth,Dheight;
 int direction;
  Pushable(float X, float Y){
    x = X;
    y = Y;
    block = loadImage("Pushable.png");
    Dheight = block.height;
    Dwidth = block.width;
  }
  
  void display(){
    image(block,x,y);
  }
  
  
  void update(){
    for(int f = (int)x; f < x+Dwidth; f++){
      if(get(f,(int)(y+Dheight)) != color(132)){
        y--;
      }
    }
  }
}
