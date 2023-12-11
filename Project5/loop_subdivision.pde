// Sample code for starting the subdivision project


public class mesh {
  PVector[] shape;
  int[] vertList;
  PVector[] faceNorm;
  boolean white;
  boolean vertShading;
  PVector[] vertNormMap;
  int[] opp;
  
  public mesh(PVector[] shape, int[] vertList) {
    this.shape = shape;
    this.vertList = vertList;
    faceNorm = getFaceNorm();
    vertNormMap = getVertNormals();
    opp = getOpp();
    vertShading = false;
    white = true;
  }
  
  
  
  PVector[] getFaceNorm() {
    PVector[] out = new PVector[500];
    for (int i = 0; i < vertList.length/3; i++) {
      PVector v1 = shape[vertList[i*3]];
      PVector v2 = shape[vertList[i*3+1]];
      PVector v3 = shape[vertList[i*3+2]];
      
      PVector u = PVector.sub(v2, v1);
      
      PVector v = PVector.sub(v3, v1);
      PVector n = u.cross(v).normalize();
      n.mult(-1);
      out[i] = new PVector(n.x, n.y, n.z);
      //out[i].x = n.x;
      //out[i].y = n.y;
      //out[i].z = n.z;
    }
    
    
    return out;
  }
  
  int[] getOpp() {
    int[] out = new int[1000];
    for (int i = 0; i < vertList.length; i++) {
      for (int j = 0; j < vertList.length; j++) {
        if (i != j) {
          PVector nextI = shape[vertList[next(i)]];
          PVector prevI = shape[vertList[prev(i)]];
          PVector nextJ = shape[vertList[next(j)]];
          PVector prevJ = shape[vertList[prev(j)]];
          if (nextI == prevJ && prevI == nextJ) {
            out[i] = j;
            out[j] = i;
          }
        }
      }
    }
    return out;
  }
  
  PVector[] getVertNormals() {
    vertNormMap = new PVector[500];
    for (int i = 0; i < shape.length; i++) {
      PVector[] adjFaceNorm = new PVector[500];
      int counter = 0;
      
      for (int j = 0; j < vertList.length; j++) {
        if (vertList[j] == i) {
          adjFaceNorm[counter] =  faceNorm[j/3];
          counter++;
        }
      }
      
      PVector v = new PVector(0.0, 0.0, 0.0);
      
      for (int k = 0; k < counter; k++) {
        //v.add(adjFaceNorm[k]);
        
        v.x += adjFaceNorm[k].x;
        v.y += adjFaceNorm[k].y;
        v.z += adjFaceNorm[k].z;
      }
      
      v.normalize();
      vertNormMap[i] = v;
    }
    
    return vertNormMap;
  }
  
  PVector getVertNorm(PVector v) {
    for (int i = 0; i < shape.length; i++) {
      if (shape[i] == v) {
        return vertNormMap[i];
      }
    }
    return null;
    
   
  }
  
  
}
mesh currMesh;
int currCorner;

// parameters used for object rotation by mouse
float mouseX_old = 0;
float mouseY_old = 0;
PMatrix3D rot_mat = new PMatrix3D();

// initialize stuff
void setup() {
  size (800, 800, OPENGL);
  currCorner = 0;
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
  if (currMesh == null) {
    beginShape();
    normal (0.0, 0.0, 1.0);
    vertex (-1.0, -1.0, 0.0);
    vertex ( 1.0, -1.0, 0.0);
    vertex ( 1.0,  1.0, 0.0);
    vertex (-1.0,  1.0, 0.0);
    endShape(CLOSE);
  } else {
    for (int faceId = 0; faceId < currMesh.vertList.length/3; faceId++) {
      
      if (currMesh.white) {
        fill(200,200,200);
      }
      PVector v1 = currMesh.shape[currMesh.vertList[faceId*3]];
      PVector v2 = currMesh.shape[currMesh.vertList[faceId*3+1]];
      PVector v3 = currMesh.shape[currMesh.vertList[faceId*3+2]];
      
      if (currMesh.vertShading) {
        noStroke();
        PVector n1 = currMesh.getVertNorm(v1);
        PVector n2 = currMesh.getVertNorm(v2);
        PVector n3 = currMesh.getVertNorm(v3);
        
        beginShape();
        
        normal(n1.x, n1.y, n1.z);
        vertex(v1.x, v1.y, v1.z);
        
        normal(n2.x, n2.y, n2.z);
        vertex(v2.x, v2.y, v2.z);
        
        normal(n3.x, n3.y, n3.z);
        vertex(v3.x, v3.y, v3.z);
        
        endShape(CLOSE);
      } else {

        
        beginShape();
        
        
        vertex(v1.x, v1.y, v1.z);
        vertex(v2.x, v2.y, v2.z);
        vertex(v3.x, v3.y, v3.z);
        
        endShape();
      }
      
      
      
    }
    pushMatrix();
    float x = (currMesh.shape[currMesh.vertList[currCorner]].x *6.0+currMesh.shape[currMesh.vertList[next(currCorner)]].x + currMesh.shape[currMesh.vertList[next(next(currCorner))]].x) / 8.0;
    float y = (currMesh.shape[currMesh.vertList[currCorner]].y *6.0+currMesh.shape[currMesh.vertList[next(currCorner)]].y + currMesh.shape[currMesh.vertList[next(next(currCorner))]].y) / 8.0;
    float z = (currMesh.shape[currMesh.vertList[currCorner]].z *6.0+currMesh.shape[currMesh.vertList[next(currCorner)]].z + currMesh.shape[currMesh.vertList[next(next(currCorner))]].z) / 8.0;
    
    translate(x,y,z);
    fill(0, 120, 220);
    noStroke();
    sphere(0.1);
    
    popMatrix();
  }
  
  popMatrix();
}

int next(int vert) {
  return (vert / 3) * 3 + (vert + 1) % 3;
}

int swing(int vert) {
  return currMesh.opp[next(vert)];
}

int prev(int vert) {
  return next(next(vert));
}

int opposite(int vert) {
  return currMesh.opp[vert];
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
    currCorner = next(currCorner);
  }
  else if (key == 'p') {
    // previous corner operation
    currCorner = next(next(currCorner));
  }
  else if (key == 'o') {
    // opposite corner operation
    currCorner = opposite(currCorner);
  }
  else if (key == 's') {
    // swing corner operation
    currCorner = swing(currCorner);
  }
  else if (key == 'f') {
    // flat shading, with black edges
    currMesh.vertShading = false;
  }
  else if (key == 'g') {
    // Gouraud shading with per-vertex normals
    currMesh.vertShading = true;
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
  
  PVector[] shape = new PVector[500];
  for (int i = 0; i < num_vertices; i++) {
    words = split (lines[i+2], " ");
    float x = float(words[0]) * scale_value;
    float y = float(words[1]) * scale_value;
    float z = float(words[2]) * scale_value;
    println ("vertex = " + x + " " + y + " " + z);
    shape[i] = new PVector(x, y, z);
  }

  // read in the faces
  int[] vertList = new int[0];
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
    vertList = append(vertList, index1);
    vertList = append(vertList, index2);
    vertList = append(vertList, index3);
  }
  currMesh = new mesh(shape, vertList);
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
