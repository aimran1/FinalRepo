class StartScreen extends Screen{
  PImage cover;
  int type;
  int clickX1,clickY1,clickX2,clickY2;
StartScreen(int i){
  type = i;
    if ( i == 0){
       cover = loadImage("cover.jpg"); 
    clickX1 = 686;
    clickY1 = 779;
    clickX2 = 986;
    clickY2 = 829;

    }
    if ( i == 1){
       cover = loadImage("victory.jpg"); 
           clickX1 = 686;
    clickY1 = 779;
    clickX2 = 855;
    clickY2 = 829;
    }  
    if ( i == 2){
       cover = loadImage("gameOver.png"); 
    clickX1 = 686;
    clickY1 = 779;
    clickX2 = 855;
    clickY2 = 829;
    }
  }
  
  int[] getLocs(){
    int[] temp = new int[4];
    temp[0] = clickX1;
    temp[1] = clickX2;
    temp[2] = clickY1;
    temp[3] = clickY2;
    return temp;
  }
  
  void display(){
    surface.setSize(1200,873);
    imageMode(CENTER);
    if(type == 0){
    image(cover,width/2,height/2);
    rect(686,779,300,50);
    fill(0);
    text("Begin Your Quest",686,779,986,829);
  
    textSize(35);
    fill(color(150,150,150));
    }
    else if(type == 1){
    image(cover,width/2,height/2);
    rect(686,779,174,50);
    fill(0);
    text("Play Again",686,779,860,829);
 
    textSize(35);
    fill(color(150,150,150));
    }
else if(type == 2){
    image(cover,width/2,height/2);
    rect(686,779,169,50);
    fill(0);
    text("Try Again",686,779,855,829);
 
    textSize(35);
    fill(color(150,150,150));
    }
    cover.resize(1200,873);
  }
  
    boolean isScreen(){
     return false; 
  }
  
  boolean isStart(){
   return true; 
  }
  
  
}
