class StartScreen extends Screen{
  PImage cover;
StartScreen(int i){
    if ( i == 0){
       cover = loadImage("cover.jpg"); 
    }
    if ( i == 1){
       cover = loadImage("victory.jpg"); 
    }  
    if ( i == 2){
       cover = loadImage("gameOver.PNG"); 
    }
  }
  
  void display(){
    image(cover,width/2,height/2);
    rect(550,430,300,50);
    fill(0);
    text("Begin Your Quest",550,430,850,480);
    textSize(35);
    fill(color(0,225,225));
  }
  
    boolean isScreen(){
     return false; 
  }
  
  boolean isStart(){
   return true; 
  }
}
