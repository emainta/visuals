boolean pippo;
int count;
float h;

void setup() {
  //size(600, 400);
  fullScreen();
  //smooth(8);
  frameRate(30);
  pippo = false;
  count = 30;
  colorMode(HSB, count);
}


void draw() {


  if (pippo) {
    background(h, 30, count);
    count--;
    if (count <0) {
      pippo = false;
      count = 30;
    }
  } else {
    background(0);
    //count = 30;
  }
}

void keyPressed() {
  count = 30;
  h = noise(frameCount/10.0)*30;
  pippo = true;
}
