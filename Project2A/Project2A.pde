// Code Graveyard

// Draw a cylinder

  //pushMatrix();

  //// diffuse (fill), ambient and specular material properties
  //fill (200, 60, 60);        // "fill" sets both diffuse and ambient color
  //ambient (50, 50, 50);      // set ambient color
  //specular (150, 150, 150);  // set specular color
  //shininess (5.0);           // set specular exponent

  //translate (-30, 0, 0);
  //rotate (time, 1.0, 0.0, 0.0);      // rotate based on time
  //translate (0.0, -10.0, 0.0);
  //cylinder (10.0, 20.0, 32);

  //popMatrix();

  //// Draw a sphere

  //pushMatrix();

  //fill (60, 200, 60);
  //ambient (50, 50, 50);
  //specular (155, 155, 155);
  //shininess (15.0);

  //sphereDetail (40);
  //translate (2 * sin(2 * time), 0, 0);  // translate based on time
  //sphere (13);

  //popMatrix();

  //// Draw a box

  //pushMatrix();

  //fill (100, 100, 200);
  //ambient (100, 100, 200);
  //specular (0, 0, 0);
  //shininess (1.0);

  //translate (30, 0, 0);
  //rotate (-time, 1.0, 0.0, 0.0);      // rotate based on time
  //box (20);

  //popMatrix();
  
  
//  void tapperCylinder (float radius, float height, int sides) {
//  int i,ii;
//  float []c = new float[sides];
//  float []s = new float[sides];

//  for (i = 0; i < sides; i++) {
//    float theta = TWO_PI * i / (float) sides;
//    c[i] = cos(theta);
//    s[i] = sin(theta);
//  }
  
//  // bottom end cap
  
//  normal (0.0, -1.0, 0.0);
//  for (i = 0; i < sides; i++) {
//    ii = (i+1) % sides;
//    beginShape(TRIANGLES);
//    vertex (c[ii] * radius / 2.0, 0.0, s[ii] * radius / 2.0);
//    vertex (c[i] * radius / 2.0, 0.0, s[i] * radius / 2.0);
//    vertex (0.0, 0.0, 0.0);
//    endShape();
//  }
  
//  // top end cap

//  normal (0.0, 1.0, 0.0);
//  for (i = 0; i < sides; i++) {
//    ii = (i+1) % sides;
//    beginShape(TRIANGLES);
//    vertex (c[ii] * radius, height, s[ii] * radius);
//    vertex (c[i] * radius, height, s[i] * radius);
//    vertex (0.0, height, 0.0);
//    endShape();
//  }
  
//  // main body of cylinder
//  for (i = 0; i < sides; i++) {
//    ii = (i+1) % sides;
//    beginShape();
//    normal (c[i], 0.0, s[i]);
//    vertex (c[i] * radius, 0.0, s[i] * radius);
//    vertex (c[i] * radius, height, s[i] * radius);
//    normal (c[ii], 0.0, s[ii]);
//    vertex (c[ii] * radius /2.0, height, s[ii] * radius /2.0);
//    vertex (c[ii] * radius /2.0, 0.0, s[ii] * radius /2.0);
//    endShape(CLOSE);
//  }
//}
