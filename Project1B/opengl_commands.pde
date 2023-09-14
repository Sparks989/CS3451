// Dummy routines for OpenGL commands.

// You should modify the routines below to complete the assignment.
// Feel free to define any classes, global variables, and helper routines that you need.

float [][] C = new float[4][4];
             
float[][] I = {{1,0,0,0},
               {0,1,0,0},
               {0,0,1,0},
               {0,0,0,1}};
             
ArrayList<float[][]> matrixStack = new ArrayList<float[][]>();
int currentTop = 0;
ArrayList<float[]> pointArray = new ArrayList<float[]>();

point instance = new point();

void Init_Matrix()
{
  matrixStack = new ArrayList<float[][]>();
  currentTop = 0;
  float[][] Identity = {{1,0,0,0},
                        {0,1,0,0},
                        {0,0,1,0},
                        {0,0,0,1}};
  matrixStack.add(Identity);
  C = matrixStack.get(currentTop);
}

void Push_Matrix()
{
  float [][] oldTop = new float[4][4];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      oldTop[i][j] = matrixStack.get(currentTop)[i][j];
    }
  }

  matrixStack.add(oldTop);
  currentTop++;
  C = matrixStack.get(currentTop);
}

void Pop_Matrix()
{
  if (currentTop == 0) {
    println("Error: Cannot pop the matrix stack");
  } else {
    matrixStack.remove(currentTop);
    currentTop--;
    C = matrixStack.get(currentTop);
  }
}

void Print_CTM()
{
  for (int i = 0; i < 4; i++) {
    for (int j =0; j < 4; j++) {
      print(C[i][j]);
    }
    println();
  }
  println();
}

void MatrixMultiply(float [][] m1, float [][] m2) {
  float[][] resultMatrix = new float[4][4];
  resultMatrix[0][0] = m1[0][0]*m2[0][0]+m1[0][1]*m2[1][0]+m1[0][2]*m2[2][0]+m1[0][3]*m2[3][0];
  resultMatrix[0][1] = m1[0][0]*m2[0][1]+m1[0][1]*m2[1][1]+m1[0][2]*m2[2][1]+m1[0][3]*m2[3][1];
  resultMatrix[0][2] = m1[0][0]*m2[0][2]+m1[0][1]*m2[1][2]+m1[0][2]*m2[2][2]+m1[0][3]*m2[3][2];
  resultMatrix[0][3] = m1[0][0]*m2[0][3]+m1[0][1]*m2[1][3]+m1[0][2]*m2[2][3]+m1[0][3]*m2[3][3];
  
  resultMatrix[1][0] = m1[1][0]*m2[0][0]+m1[1][1]*m2[1][0]+m1[1][2]*m2[2][0]+m1[1][3]*m2[3][0];
  resultMatrix[1][1] = m1[1][0]*m2[0][1]+m1[1][1]*m2[1][1]+m1[1][2]*m2[2][1]+m1[1][3]*m2[3][1];
  resultMatrix[1][2] = m1[1][0]*m2[0][2]+m1[1][1]*m2[1][2]+m1[1][2]*m2[2][2]+m1[1][3]*m2[3][2];
  resultMatrix[1][3] = m1[1][0]*m2[0][3]+m1[1][1]*m2[1][3]+m1[1][2]*m2[2][3]+m1[1][3]*m2[3][3];
  
  resultMatrix[2][0] = m1[2][0]*m2[0][0]+m1[2][1]*m2[1][0]+m1[2][2]*m2[2][0]+m1[2][3]*m2[3][0];
  resultMatrix[2][1] = m1[2][0]*m2[0][1]+m1[2][1]*m2[1][1]+m1[2][2]*m2[2][1]+m1[2][3]*m2[3][1];
  resultMatrix[2][2] = m1[2][0]*m2[0][2]+m1[2][1]*m2[1][2]+m1[2][2]*m2[2][2]+m1[2][3]*m2[3][2];
  resultMatrix[2][3] = m1[2][0]*m2[0][3]+m1[2][1]*m2[1][3]+m1[2][2]*m2[2][3]+m1[2][3]*m2[3][3];
  
  resultMatrix[3][0] = m1[3][0]*m2[0][0]+m1[3][1]*m2[1][0]+m1[3][2]*m2[2][0]+m1[3][3]*m2[3][0];
  resultMatrix[3][1] = m1[3][0]*m2[0][1]+m1[3][1]*m2[1][1]+m1[3][2]*m2[2][1]+m1[3][3]*m2[3][1];
  resultMatrix[3][2] = m1[3][0]*m2[0][2]+m1[3][1]*m2[1][2]+m1[3][2]*m2[2][2]+m1[3][3]*m2[3][2];
  resultMatrix[3][3] = m1[3][0]*m2[0][3]+m1[3][1]*m2[1][3]+m1[3][2]*m2[2][3]+m1[3][3]*m2[3][3];
  
  for (int i = 0; i < 4; i++) {
    for (int j =0; j < 4; j++) {
      C[i][j] = resultMatrix[i][j];
    }
  }
  
}

void Translate(float x, float y, float z)
{
  float [][] translateMatrix = {{1,0,0,x},
                                {0,1,0,y},
                                {0,0,1,z},
                                {0,0,0,1}};
  
  MatrixMultiply(C,translateMatrix);
}

void Scale(float x, float y, float z)
{
  float [][] scaleMatrix = {{x,0,0,0},
                            {0,y,0,0},
                            {0,0,z,0},
                            {0,0,0,1}};
                            
  MatrixMultiply(C,scaleMatrix);
}

void RotateX(float theta)
{
  theta = theta*PI/180.0;
  float [][] xRotateMatrix = {{1,0,0,0},
                              {0,cos(theta),-sin(theta),0},
                              {0,sin(theta),cos(theta),0},
                              {0,0,0,1}};
                
  MatrixMultiply(C,xRotateMatrix);
}

void RotateY(float theta)
{
  theta = theta*PI/180.0;
  float [][] yRotateMatrix = {{cos(theta),0,sin(theta),0},
                              {0,1,0,0},
                              {-sin(theta),0,cos(theta),0},
                              {0,0,0,1}};
                
  MatrixMultiply(C,yRotateMatrix);
}

void RotateZ(float theta)
{
  theta = theta*PI/180.0;
  float [][] zRotateMatrix = {{0,cos(theta),-sin(theta),0},
                              {0,sin(theta),cos(theta),0},
                              {0,0,1,0},
                              {0,0,0,1}};
                
  MatrixMultiply(C,zRotateMatrix);
}

void Perspective(float f, float near, float far) {
}

void Ortho(float l, float r, float b, float t, float n, float f) {
  instance.currX = instance.currX -l*width/(r-l);
  instance.currY = instance.currY -b*height/(t-b);
}

void Begin_Shape() {
  float[] start = {1,1};
  pointArray.add(start);
}

void Vertex(float x, float y, float z) {
  float[][] transform = {{instance.currX, 0, 0},
                         {0, instance.currY, 0},
                         {0,0, instance.currZ}};
  MatrixMultiply(C, transform);
  
  
}

void End_Shape() {
  instance.currX = 0;
  instance.currY = 0;
  instance.currZ = 0;
  line(instance.currX, instance.currY, instance.currZ, x, y);
}
