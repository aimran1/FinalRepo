class Turret extends Attack{
  int angle;
  float x,y,radius,speed;
  int xcor, ycor, range,interval;
  int i = 0;
  int time = 0;  
  PImage fire;
  PVector target, player;

  Turret(int _x,int _y, int _r, int _i){
    xcor = _x;
    ycor = _y;
    x = xcor; y= ycor;
    fire = loadImage("fire.PNG");
    range = _r;
    interval = _i;
  }
  
  
  void update(Link fg){
        target = new PVector(fg.getX()-xcor, fg.getY()- ycor);
        if (i % interval == 0){
          if (sqrt(pow(target.x,2)+pow(target.y,2)) < range){
            target.normalize();
            target.x *= speed;
            target.y *= speed;
            x *= speed;
            y *= speed;
          }
        }
        i++;
}
  
  void display(){
      image(fire,x,y);
  }
  
}
