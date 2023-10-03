// Scene Example

float time = 0;  // keep track of the "time"

void setup() {
  size (600, 600, P3D);  // use 3D here!
  noStroke();   
}

// Draw a scene with a box, cylinder and sphere
void draw() {
  
  resetMatrix();  // set the transformation matrix to the identity (important!)

  background(20, 0, 20);  // clear the screen to white

  // set up for perspective projection
  perspective (PI * 0.333, 1.0, 0.01, 1000.0);

  // place the camera in the scene
  if (time < 10) {
    camera (0, -100, 200.0, time*20 - 200, 0, -1.0, 0.0, 1.0, 0.0);
  } else {
    camera (0, -100, 200.0, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  }
  
  // create an ambient light source
  ambientLight (102, 102, 102);

  // create two directional light sources
  lightSpecular (204, 204, 204);
  directionalLight (102, 0, 102, 0, 0, -200);
  if (time >= 10) {
    directionalLight(150, 102, 0, -2, 3, 20);
    directionalLight(150, 102, 0, 2, 3, 20);
  }
  //directionalLight (152, 152, 152, 0, 0, -1);

  pushMatrix();
  translate(0,-80,0);
  if (time > 15 && time < 50) {
    translate(0, 0, time*10.0);
  }
  drawPerson();
  popMatrix();

  // step forward the time
  time += 0.03;
}

// Process key press events
void keyPressed()
{
  if (key == 's' || key =='S') {
    save ("image_file.jpg");
    println ("Screen shot was saved in JPG file.");
  }
}

void drawPerson() {
  //DrawNeck
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(0,4,0);
  cylinder(7, 20, 32);
  
  popMatrix();
  
  //Draw Head
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (5.0);
  
  sphereDetail(40);
  sphere(10);
  
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (5.0);
  
  scale(.9,1.2,1);
  translate(0,2,1);
  sphereDetail(40);
  sphere(10);
  
  popMatrix();
  //Draw Chest
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  scale(1.8,2.5,2);
  translate(0,15,0);
  sphereDetail(40);
  sphere(10);
  
  popMatrix();
  //Draw Shoulders
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(20,20,0);
  sphereDetail(40);
  sphere(6);
  
  popMatrix();
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-20,20,0);
  sphereDetail(40);
  sphere(6);
  
  popMatrix();
  //Draw Pelvis
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(0,50,0);
  scale(1.5,2,.8);
  box(20);
  popMatrix();
  //Draw Hip
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(25,60,0);
  scale(.5,1,.8);
  rotateY(PI/2.0);
  sphereDetail(40);
  sphere(10);
  
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-25,60,0);
  scale(.5,1,.8);
  sphereDetail(40);
  sphere(10);
  
  popMatrix();
  //Draw Thighs
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(22, 75, 0);
  cylinder(10, 35, 32);
  
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-22, 75, 0);
  cylinder(10, 35, 32);
  
  popMatrix();
  //Draw Knees
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(22, 120, 0);
  sphereDetail(40);
  sphere(10);
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-22, 120, 0);
  sphereDetail(40);
  sphere(10);
  popMatrix();
  //Draw Calves
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(22, 130, 0);
  cylinder(8, 32, 32);
  
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-22, 130, 0);
  cylinder(8, 32, 32);
  
  popMatrix();
  //Draw Feet
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(22,170,5);
  scale(1,1,2.4);
  box(10);
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-22,170,5);
  scale(1,1,2.4);
  box(10);
  popMatrix();
  //Draw Upper Arm
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(45, 10,0);
  rotateZ(20);
  
  cylinder(5, 20, 32);
  
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-28, 25, 0);
  rotateZ(20);
  
  cylinder(5, 20, 32);
  
  popMatrix();
  //Elbow
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(50, 8, 0);
  sphereDetail(40);
  sphere(5);
  
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-50, 35, 0);
  sphereDetail(40);
  sphere(5);
  
  popMatrix();
  //Forearms
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(50, 15, 0);
  cylinder(4, 25, 32);
  
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-50, 42, 0);
  cylinder(4, 25, 32);
  
  popMatrix();
  //Draw Hands
  pushMatrix();
  
  fill (40, 200, 180);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(50, 45, 0);
  scale(1,1.8,.8);
  sphereDetail(40);
  sphere(5);
  
  popMatrix();
  pushMatrix();
  
  fill (60, 200, 60);
  ambient (50, 50, 50);
  specular (155, 155, 155);
  shininess (15.0);
  
  translate(-50, 70, 0);
  scale(1,1.8,.8);
  sphereDetail(40);
  sphere(5);
  
  popMatrix();
  
}

void triangularPrisim() {
  beginShape();
  
  
  vertex(-100, -100, -100);
  vertex( 100, -100, -100);
  vertex(   0,    0,  100);

  vertex( 100, -100, -100);
  vertex( 100,  100, -100);
  vertex(   0,    0,  100);

  vertex( 100, 100, -100);
  vertex(-100, 100, -100);
  vertex(   0,   0,  100);

  vertex(-100,  100, -100);
  vertex(-100, -100, -100);
  vertex(   0,    0,  100);
  endShape();
}


// Draw a cylinder of a given radius, height and number of sides.
// The base is on the y=0 plane, and it extends vertically in the y direction.
void cylinder (float radius, float height, int sides) {
  int i,ii;
  float []c = new float[sides];
  float []s = new float[sides];

  for (i = 0; i < sides; i++) {
    float theta = TWO_PI * i / (float) sides;
    c[i] = cos(theta);
    s[i] = sin(theta);
  }
  
  // bottom end cap
  
  normal (0.0, -1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (0.0, 0.0, 0.0);
    endShape();
  }
  
  // top end cap

  normal (0.0, 1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    vertex (0.0, height, 0.0);
    endShape();
  }
  
  // main body of cylinder
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape();
    normal (c[i], 0.0, s[i]);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    normal (c[ii], 0.0, s[ii]);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    endShape(CLOSE);
  }
}
