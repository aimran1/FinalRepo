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
    background(cover);
  }
  
    boolean isScreen(){
     return false; 
  }
  
  boolean isStart(){
   return true; 
  }
}
