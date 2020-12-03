static final int NUM_STARS = 600;
Star stars[] = new Star[NUM_STARS];

float speed;

void setup(){
  size(1200,700);
 
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

}

void draw(){
  speed = map(mouseX, 0, width, 0, 50);
  background(5,0,10);
  translate(width/2, height/2);
  
  for(int i = 0; i < stars.length ; i++){
    
    stars[i].show();
    stars[i].update();
  
  }

}
