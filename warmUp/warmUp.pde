

float d;
float smallR;
float shift;
float theta;
void setup() {
  size(800,800);
}

void draw() {
  shift = mouseX/800.0;
  d = 200*(1+shift);
  smallR = -100 + mouseY/8;
  
  background(0,155,155);
  beginShape();
  vertex(width/2-200*sin(0), height/2-200*cos(0));
  vertex(width/2-200*sin(2*PI/5), height/2-200*cos(2*PI/5));
  vertex(width/2-200*sin(4*PI/5), height/2-200*cos(4*PI/5));
  vertex(width/2-200*sin(6*PI/5), height/2-200*cos(6*PI/5));
  vertex(width/2-200*sin(8*PI/5), height/2-200*cos(8*PI/5));
  fill(200,0,100);
  endShape(CLOSE);
  
  int counter = 4;
  drawSmall(counter, d, smallR, width/2, height/2, 2*PI/5);

  
  println(mouseX + "," + mouseY + "," + shift);
}

void drawSmall(int counter, float diameter, float smallRadius, float xC, float yC, float theta) {
  if (counter == 0) {
    return;
  }
  counter--;
  theta += 2*PI/5;
  for (int i = 0; i < 5; i++) {
    beginShape();
    vertex(xC+diameter*sin(i*theta)-smallRadius*sin(0), yC+diameter*cos(i*theta)-smallRadius*cos(0));
    vertex(xC+diameter*sin(i*theta)-smallRadius*sin(2*PI/5), yC+diameter*cos(i*theta)-smallRadius*cos(2*PI/5));
    vertex(xC+diameter*sin(i*theta)-smallRadius*sin(4*PI/5), yC+diameter*cos(i*theta)-smallRadius*cos(4*PI/5));
    vertex(xC+diameter*sin(i*theta)-smallRadius*sin(6*PI/5), yC+diameter*cos(i*theta)-smallRadius*cos(6*PI/5));
    vertex(xC+diameter*sin(i*theta)-smallRadius*sin(8*PI/5), yC+diameter*cos(i*theta)-smallRadius*cos(8*PI/5));
    fill(0,225,115);
    endShape(CLOSE);
  }
  
  for (int j = 0; j < 5; j++) {
    drawSmall(counter, diameter/2.0, smallRadius/2.0, xC+diameter*sin(j*theta), yC+diameter*cos(j*theta), theta);
  }
}
