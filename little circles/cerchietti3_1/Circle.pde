class Circle {

  float x;
  float y;
  float [] px, py;
  float maxR = 20;
  float nnn = 0.5;
  float radius;
  float ang, angVel, angVelMax, angAcc;


  Circle (float x, float y) {
    this.x = x;
    this.y = y;
    this.px = new float[4];
    this.py = new float[4];
    fillZeros(px);
    fillZeros(py);
    this.radius = 0;
    this.ang = 0;
    this.angVel = 0;
    this.angVelMax = 0.5;
    this.angAcc = 0.07;
  }

  void show() {
    float deltaX = radius*sqrt(2)*cos(ang);
    float deltaY = radius*sqrt(2)*sin(ang);

    float disX, disY, var1, var2;
    var1 = nnn*this.angVel*sin(TWO_PI*noise(frameCount/30.0));
    var2 = nnn*this.angVel*cos(TWO_PI*noise(frameCount/50.0)+0.1);

    disX = this.x + (1+var1)*deltaX + 0.5*var2*maxR;
    disY = this.y + (1+var2)*deltaY + 0.5*var1*maxR;

    //pusha nuovi valori
    shiftAndAdd(px, disX);
    shiftAndAdd(py, disY);

    //disegna
    if (checkNeg(px)) curve(px[0], py[0], px[1], py[1], px[2], py[2], px[3], py[3]);
    this.update();
  }

  void update() {
    if (radius < maxR) radius += 0.2;
    ang += angVel;
    if (angVel < angVelMax) angVel += angAcc;
  }

  void fillZeros(float[] arr) {
    for (int i = 0; i<arr.length; i++) arr[i] = -1;
  }

  // shift all the values to the left, and set the new value at the end
  void shiftAndAdd(float a[], float val) {
    int a_length = a.length;
    System.arraycopy(a, 1, a, 0, a_length-1);
    a[a_length-1] = val;
  }

  boolean checkNeg(float[] arr) { 
    for (int i = 0; i<arr.length-1; i++) {
      if (arr[i] < 0) return false;
    }
    return true;
  }
}
