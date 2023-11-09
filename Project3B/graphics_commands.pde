// Routines for graphics commands (especially for shading and z-buffer).
// Most of these are for you to write.

public enum Shading { WIREFRAME, CONSTANT, FLAT, GOURAUD, PHONG }
Shading shade = Shading.CONSTANT;  // the current shading mode

// current transformation matrix and its adjoint
PMatrix3D cmat;
PMatrix3D adj;

float field_of_view = 0.0;  // non-zero value indicates perspective projection


// you should initialize your z-buffer here, and also various material color parameters
void Init_Scene() {
  
  // create the current transformation matrix, and its adjoint for transforming the normals
  cmat = new PMatrix3D();
  cmat.reset();             // sets the current transformation to the identity
    
  // calculate the adjoint of the transformation matrix
  PMatrix3D imat = cmat.get(); 
  boolean okay = imat.invert();
  if (!okay) {
    println ("matrix singular, cannot invert");
    exit();
  }
  adj = imat.get();
  adj.transpose();
  
  // initialize your z-buffer here
  
  // set default values to material colors here
}

void Set_Field_Of_View (float fov)
{
  field_of_view = fov;
}

void Set_Color (float r, float g, float b)
{
}

void Ambient_Specular (float ar, float ag, float ab, float sr, float sg, float sb, float pow)
{
}

void Normal(float nx, float ny, float nz)
{
}

void Set_Light (float x, float y, float z, float r, float g, float b)
{
  // set light value here
  // don't forget to normaize the direction of the light vector
}

void Begin_Shape() {
}

// some of this code is provided, but you should save the resulting projected coordinates
// and surface normals in your own data structures for vertices
void Vertex(float vx, float vy, float vz) {
  
  float x,y,z;

  // transform this vertex by the current transformation matrix
  x = vx * cmat.m00 + vy * cmat.m01 + vz * cmat.m02 + cmat.m03;
  y = vx * cmat.m10 + vy * cmat.m11 + vz * cmat.m12 + cmat.m13;
  z = vx * cmat.m20 + vy * cmat.m21 + vz * cmat.m22 + cmat.m23;

  // calculate the transformed surface normal (using the adjoint)
  // note that you need to provide normal_x, normal_y and normal_z set from the Normal() command
  float nx,ny,nz;
  //nx = normal_x * adj.m00 + normal_y * adj.m01 + normal_z * adj.m02 + adj.m03;
  //ny = normal_x * adj.m10 + normal_y * adj.m11 + normal_z * adj.m12 + adj.m13;
  //nz = normal_x * adj.m20 + normal_y * adj.m21 + normal_z * adj.m22 + adj.m23;
  
  float xx = x;
  float yy = y;
  float zz = z;
  
  // field of view greater than zero means use perspective projection
  if (field_of_view > 0) {
    float theta = field_of_view * PI / 180.0;  // convert to radians
    float k = tan (theta / 2);
    xx = x / abs(z);
    yy = y / abs(z);
    xx = (xx + k) * width  / (2 * k);
    yy = (yy + k) * height / (2 * k);
    zz = z;
  }
  
  // xx,yy,zz are screen space coordinates of the vertex, after transformation and projection

  // !!!! store xx,yy,zz and nx,ny,nz somewhere for you to use for rasterization and shading !!!!

}

// rasterize a triangle
void End_Shape() {
  
  // make wireframe (line) drawing if that is the current shading mode
  if (shade == Shading.WIREFRAME) {
    stroke (0, 0, 0);
    strokeWeight (2.0);
    // draw lines between your stored vertices (adjust to your data structures)
    //line (v0.x, height - v0.y, v1.x, height - v1.y);
    //line (v0.x, height - v0.y, v2.x, height - v2.y);
    //line (v1.x, height - v1.y, v2.x, height - v2.y);
    return;
  }
  
  // this is where you should add your rasterization code from Project 3A

}

// set the current transformation matrix and its adjoint
void Set_Matrix (
float m00, float m01, float m02, float m03,
float m10, float m11, float m12, float m13,
float m20, float m21, float m22, float m23,
float m30, float m31, float m32, float m33)
{
  cmat.set (m00, m01, m02, m03, m10, m11, m12, m13,
            m20, m21, m22, m23, m30, m31, m32, m33);

  // calculate the adjoint of the transformation matrix
  PMatrix3D imat = cmat.get(); 
  boolean okay = imat.invert();
  if (!okay) {
    println ("matrix singular, cannot invert");
    exit();
  }
  adj = imat.get();
  adj.transpose();
}
