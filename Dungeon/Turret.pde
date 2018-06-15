class Turret extends Attack{
  float flyx,flyy;
  float currx,curry;
  float speed, angle;
  PImage fire;
  PVector target, player;
  int hp,invincibleFrame;
  int range;
  int Ox,Oy;
  Link p;

  Turret(int _x,int _y, int _r,Link fg){
    Ox = _x;
    Oy = _y;
    currx = Ox;
    curry = Oy;
    fire = loadImage("fire.png");
    fire.resize(25,20);
    range = _r;
    target = new PVector(fg.getX()-Ox, fg.getY()- Oy);

    speed = 2.5;
    p = fg;
  }

  void update(){
    if (dist(currx,curry,Ox,Oy) <= range){
    target.normalize();
    flyx = target.x;
    flyy = target.y;
      flyx *= speed;
      currx += flyx;
      flyy *= speed;
      curry += flyy;
      flyx = currx;
      flyy = curry;
    }
  }

  void display(){
    if (dist(currx,curry,Ox,Oy) <= range){
    imageMode(CENTER);
      image(fire,currx,curry);
    }
  }
  
}
