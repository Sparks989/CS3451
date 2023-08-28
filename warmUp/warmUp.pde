

float d;
float smallR;

void setup() {
  size(800,800);
}

void draw() {
  d = 200*(1 + mouseX);
  smallR = mouseY;
  
  background(0,155,155);
  beginShape();
  vertex(400+200*cos(3*PI/2),400+200*sin(3*PI/2));
  vertex(400+200*cos(2*PI/5+3*PI/2), 400+200*sin(2*PI/5+3*PI/2));
  vertex(400+200*cos(4*PI/5+3*PI/2), 400+200*sin(4*PI/5+3*PI/2));
  vertex(400+200*cos(6*PI/5+3*PI/2), 400+200*sin(6*PI/5+3*PI/2));
  vertex(400+200*cos(8*PI/5+3*PI/2), 400+200*sin(8*PI/5+3*PI/2));
  fill(200,0,100);
  endShape(CLOSE);
  
  for (int i = 0; i < 5; i++) {
    beginShape();
    
    endShape(CLOSE);
    
  }
}
