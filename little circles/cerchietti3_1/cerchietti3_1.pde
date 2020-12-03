Circle[][] circles;
float NUM_COL = 8;
float fps= 60;
float scl;
int rows, cols, indexGlobal, tempo, count;

int BPM = 136;

void setup() {
  //size(800, 600);
  fullScreen();
  frameRate(fps);
  smooth(8);

  scl = width / (NUM_COL+1);
  cols = round(width / scl);
  rows = round(height / scl);
  circles = new Circle[cols][rows];

  float posX, posY;
  for (int i = 0; i < cols-1; i++) {
    for (int j = 0; j < rows-1; j++) {
      //println(i, "-", j);
      posX = scl*(i+1);
      posY = scl*(j+1);
      circles[i][j] = new Circle(posX, posY);
    }
  }

  indexGlobal = 0;
  tempo = framePerBeat(BPM);
  count = 0;

  stroke(255);
  strokeWeight(0.8);
  background(0);
  noFill();
  //frameRate(10);
}

void draw() {
  //print(" ", frameRate);
  count++;
  translate(-round((width%scl)/2), -round((height%scl)/2));

  if (indexGlobal < (rows-1)*(cols-1)) {
    int c = indexGlobal%(cols-1);
    int r = floor(indexGlobal/(cols-1));

    //println(c, "-", r);

    circles[c][r].show();

    fps = frameRate;
    tempo = framePerBeat(BPM);

    if (count > (tempo*4)) {
      //if (frameCount%(tempo*4) == 0) {
      //if (frameCount%(10) == 0) {
      indexGlobal ++;
      count = 0;
      //println(indexGlobal);
    }
  } 
  //else { exit(); }
}

int framePerBeat(int bpm) {
  //bpm++;
  int fpb;
  float bps = bpm / 60.0;
  float bpf = bps / (fps);
  fpb = round(1 / bpf);

  return fpb;
}
