

float d;
float smallR;
float shift;
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
  
  int counter = 5;
  drawSmall(counter, d, smallR, 200, 200);
  
  for (int i = 0; i< 5; i++) {
    beginShape();
    vertex(width/2+d*sin(2*i*PI/5)-smallR*sin(0), height/2+d*cos(2*i*PI/5)-smallR*cos(0));
    vertex(width/2+d*sin(2*i*PI/5)-smallR*sin(2*PI/5), height/2+d*cos(2*i*PI/5)-smallR*cos(2*PI/5));
    vertex(width/2+d*sin(2*i*PI/5)-smallR*sin(4*PI/5), height/2+d*cos(2*i*PI/5)-smallR*cos(4*PI/5));
    vertex(width/2+d*sin(2*i*PI/5)-smallR*sin(6*PI/5), height/2+d*cos(2*i*PI/5)-smallR*cos(6*PI/5));
    vertex(width/2+d*sin(2*i*PI/5)-smallR*sin(8*PI/5), height/2+d*cos(2*i*PI/5)-smallR*cos(8*PI/5));
    fill(0,225,115);
    endShape(CLOSE);
    
  }
  
  println(mouseX + "," + mouseY + "," + shift);
}

void drawSmall(int counter, float diameter, float smallRadius, float xC, float yC) {
  
}
