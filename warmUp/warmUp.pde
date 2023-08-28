

float d;
float smallR;

void setup() {
  size(800,800);
}

void draw() {
  d = 200;
  smallR = 100;
  
  background(0,155,155);
  beginShape();
  vertex(400-200*cos(PI/2),400-200*sin(PI/2));
  vertex(400-200*cos(2*PI/5+PI/2), 400-200*sin(2*PI/5+PI/2));
  vertex(400-200*cos(4*PI/5+PI/2), 400-200*sin(4*PI/5+PI/2));
  vertex(400-200*cos(6*PI/5+PI/2), 400-200*sin(6*PI/5+PI/2));
  vertex(400-200*cos(8*PI/5+PI/2), 400-200*sin(8*PI/5+PI/2));
  fill(200,0,100);
  endShape(CLOSE);
  
  for (int i = 0; i< 5; i++) {
    beginShape();
    vertex(400-d-smallR*cos(PI/2), 400-d-smallR*sin(PI/2));
    vertex(400-d-smallR*cos(2*PI/5+PI/2), 400-d-smallR*sin(2*PI/5+PI/2));
    vertex(400-d-smallR*cos(4*PI/5+PI/2), 400-d-smallR*sin(4*PI/5+PI/2));
    vertex(400-d-smallR*cos(6*PI/5+PI/2), 400-d-smallR*sin(6*PI/5+PI/2));
    vertex(400-d-smallR*cos(8*PI/5+PI/2), 400-d-smallR*sin(8*PI/5+PI/2));
    fill(0,225,115);
    endShape(CLOSE);
  }
}
