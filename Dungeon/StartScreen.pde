class StartScreen extends Screen{
  PImage cover;
StartScreen(int i){
    if ( i == 0){
       cover = loadImage("cover.jpg"); 
       cover.resize(1200,873);
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
    rect(686,779,300,50);
    fill(0);
    text("Begin Your Quest",686,779,986,829);
    textSize(35);
    fill(color(150,150,150));
  }
  
    boolean isScreen(){
     return false; 
  }
  
  boolean isStart(){
   return true; 
  }
}
