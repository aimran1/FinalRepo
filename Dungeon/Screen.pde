class Screen{
 Location[] elements; 
 Screen(boolean f){ 
  elements = new Location[1];
  elements[0] = new Location(70,40,30,20);
 }
 
 void update(Link l){
   for(int x = 0; x < elements.length;x++){
    elements[x].update(l);
  }
}
 
 void display(){
   for(int x = 0; x < elements.length;x++){
    elements[x].display();
  }
 }
}
