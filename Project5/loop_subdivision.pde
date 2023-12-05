// Sample code for starting the subdivision project

// parameters used for object rotation by mouse
float mouseX_old = 0;
float mouseY_old = 0;
PMatrix3D rot_mat = new PMatrix3D();

// initialize stuff
void setup() {
  size (800, 800, OPENGL);
}

// Draw the scene
void draw() {
  
  background (170, 170, 255);
  
  // set up for perspective projection
  perspective (PI * 0.333, 1.0, 0.01, 1000.0);
  
  // place the camera in the scene
  camera (0.0, 0.0, 5.0, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
    
  // create an ambient light source
  ambientLight (52, 52, 52);
  
  // create two directional light sources
  lightSpecular (204, 204, 204);
  directionalLight (102, 102, 102, -0.7, -0.7, -1);
  directionalLight (152, 152, 152, 0, 0, -1);
  
  pushMatrix();
  
  applyMatrix (rot_mat);  // rotate object using the global rotation matrix
  
  ambient (200, 200, 200);
  specular(0, 0, 0);
  shininess(1.0);
  
  stroke (0, 0, 0);
  fill(200, 200, 200);

  // THIS IS WHERE YOU SHOULD DRAW THE MESH

  beginShape();
  normal (0.0, 0.0, 1.0);
  vertex (-1.0, -1.0, 0.0);
  vertex ( 1.0, -1.0, 0.0);
  vertex ( 1.0,  1.0, 0.0);
  vertex (-1.0,  1.0, 0.0);
  endShape(CLOSE);
  
  popMatrix();
}

// handle keyboard input
void keyPressed() {
  if (key == '1') {
    read_mesh ("tetra.ply", 1.5);
  }
  else if (key == '2') {
    read_mesh ("octa.ply", 2.5);
  }
  else if (key == '3') {
    read_mesh ("icos.ply", 2.5);
  }
  else if (key == '4') {
    read_mesh ("star.ply", 1.0);
  }
  else if (key == '5') {
    read_mesh ("torus.ply", 1.6);
  }
  else if (key == 'n') {
    // next corner operation
  }
  else if (key == 'p') {
    // previous corner operation
  }
  else if (key == 'o') {
    // opposite corner operation
  }
  else if (key == 's') {
    // swing corner operation
  }
  else if (key == 'f') {
    // flat shading, with black edges
  }
  else if (key == 'g') {
    // Gouraud shading with per-vertex normals
  }
  else if (key == 'd') {
    // subdivide mesh
  }
  else if (key == 'q') {
    // quit program
    exit();
  }
}

// Read polygon mesh from .ply file
//
// You should modify this routine to store all of the mesh data
// into a mesh data structure instead of printing it to the screen.
void read_mesh (String filename, float scale_value)
{
  String[] words;

  String lines[] = loadStrings(filename);

  words = split (lines[0], " ");
  int num_vertices = int(words[1]);
  println ("number of vertices = " + num_vertices);

  words = split (lines[1], " ");
  int num_faces = int(words[1]);
  println ("number of faces = " + num_faces);

  // read in the vertices
  for (int i = 0; i < num_vertices; i++) {
    words = split (lines[i+2], " ");
    float x = float(words[0]) * scale_value;
    float y = float(words[1]) * scale_value;
    float z = float(words[2]) * scale_value;
    println ("vertex = " + x + " " + y + " " + z);
  }

  // read in the faces
  for (int i = 0; i < num_faces; i++) {
    
    int j = i + num_vertices + 2;
    words = split (lines[j], " ");
    
    int nverts = int(words[0]);
    if (nverts != 3) {
      println ("error: this face is not a triangle.");
      exit();
    }
    
    int index1 = int(words[1]);
    int index2 = int(words[2]);
    int index3 = int(words[3]);
    println ("face = " + index1 + " " + index2 + " " + index3);
  }
}

// remember old mouse position
void mousePressed()
{
  mouseX_old = mouseX;
  mouseY_old = mouseY;
}

// modify rotation matrix when mouse is dragged
void mouseDragged()
{
  if (!mousePressed)
    return;
  
  float dx = mouseX - mouseX_old;
  float dy = mouseY - mouseY_old;
  dy *= -1;

  float len = sqrt (dx*dx + dy*dy);
  if (len == 0)
      len = 1;
  
  dx /= len;
  dy /= len;
  PMatrix3D rmat = new PMatrix3D();
  rmat.rotate (len * 0.005, dy, dx, 0);
  rot_mat.preApply (rmat);

  mouseX_old = mouseX;
  mouseY_old = mouseY;
}
