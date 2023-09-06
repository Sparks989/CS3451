// Matrix Stack Library - You will write this!

// You should modify the routines below to complete the assignment.
// Feel free to define any classes, global variables, and helper routines that you need.
float [][] C = {{1,0,0,0},
                {0,1,0,0},
                {0,0,1,0},
                {0,0,0,1}};
             
float[][] I = {{1,0,0,0},
               {0,1,0,0},
               {0,0,1,0},
               {0,0,0,1}};
             
float [][][] matrixStack = {{},{},{},{},{}};
int currentTop = 0;

void Init_Matrix()
{
    matrixStack[0] = I;
}

void Push_Matrix()
{
  matrixStack[currentTop+1] = I;
  currentTop++;
  C = matrixStack[currentTop];
}

void Pop_Matrix()
{
  if (currentTop == 0) {
    println("Error: Cannot pop the matrix stack");
  } else {
    matrixStack[currentTop] = I;
    currentTop--;
    C = matrixStack[currentTop];
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

float[][] MatrixMultiply(float [][] m1, float [][] m2) {
  float[][] resultMatrix = I;
  resultMatrix[0][0] = m1[0][0]*m2[0][0]+m1[1][0]*m2[0][1]+m1[2][0]*m2[0][2]+m1[3][0]*m2[0][3];
  resultMatrix[1][0] = m1[0][0]*m2[1][0]+m1[1][0]*m2[1][1]+m1[2][0]*m2[1][2]+m1[3][0]*m2[1][3];
  resultMatrix[2][0] = m1[0][0]*m2[2][0]+m1[1][0]*m2[2][1]+m1[2][0]*m2[2][2]+m1[3][0]*m2[2][3];
  resultMatrix[3][0] = m1[0][0]*m2[3][0]+m1[1][0]*m2[3][1]+m1[2][0]*m2[3][2]+m1[3][0]*m2[3][3];
  
  resultMatrix[0][1] = m1[0][1]*m2[0][0]+m1[1][1]*m2[0][1]+m1[2][1]*m2[0][2]+m1[3][1]*m2[0][3];
  resultMatrix[1][1] = m1[0][1]*m2[1][0]+m1[1][1]*m2[1][1]+m1[2][1]*m2[1][2]+m1[3][1]*m2[1][3];
  resultMatrix[2][1] = m1[0][1]*m2[2][0]+m1[1][1]*m2[2][1]+m1[2][1]*m2[2][2]+m1[3][1]*m2[2][3];
  resultMatrix[3][1] = m1[0][1]*m2[3][0]+m1[1][1]*m2[3][1]+m1[2][1]*m2[3][2]+m1[3][1]*m2[3][3];
  
  resultMatrix[0][2] = m1[0][2]*m2[0][0]+m1[1][2]*m2[0][1]+m1[2][2]*m2[0][2]+m1[3][2]*m2[0][3];
  resultMatrix[1][2] = m1[0][2]*m2[1][0]+m1[1][2]*m2[1][1]+m1[2][2]*m2[1][2]+m1[3][2]*m2[1][3];
  resultMatrix[2][2] = m1[0][2]*m2[2][0]+m1[1][2]*m2[2][1]+m1[2][2]*m2[2][2]+m1[3][2]*m2[2][3];
  resultMatrix[3][2] = m1[0][2]*m2[3][0]+m1[1][2]*m2[3][1]+m1[2][2]*m2[3][2]+m1[3][2]*m2[3][3];
  
  resultMatrix[0][3] = m1[0][3]*m2[0][0]+m1[1][3]*m2[0][1]+m1[2][3]*m2[0][2]+m1[3][3]*m2[0][3];
  resultMatrix[1][3] = m1[0][3]*m2[1][0]+m1[1][3]*m2[1][1]+m1[2][3]*m2[1][2]+m1[3][3]*m2[1][3];
  resultMatrix[2][3] = m1[0][3]*m2[2][0]+m1[1][3]*m2[2][1]+m1[2][3]*m2[2][2]+m1[3][3]*m2[2][3];
  resultMatrix[3][3] = m1[0][3]*m2[3][0]+m1[1][3]*m2[3][1]+m1[2][3]*m2[3][2]+m1[3][3]*m2[3][3];
  
  return resultMatrix;
}

void Translate(float x, float y, float z)
{
  float [][] translateMatrix = {{1,0,0,x},
                                {0,1,0,y},
                                {0,0,1,z},
                                {0,0,0,1}};
                                 
  matrixStack[currentTop] = MatrixMultiply(translateMatrix,matrixStack[currentTop]);
}

void Scale(float x, float y, float z)
{
  float [][] scaleMatrix = {{x,0,0,0},
                            {0,y,0,0},
                            {0,0,z,0},
                            {0,0,0,1}};
                            
  matrixStack[currentTop] = MatrixMultiply(scaleMatrix, matrixStack[currentTop]);
}

void RotateX(float theta)
{
  float [][] xRotateMatrix = {{1,0,0,0},
                              {0,cos(theta),-sin(theta),0},
                              {0,sin(theta),cos(theta),0},
                              {0,0,0,1}};
                
  C = MatrixMultiply(xRotateMatrix, C);
}

void RotateY(float theta)
{
  float [][] yRotateMatrix = {{cos(theta),0,sin(theta),0},
                              {0,1,0,0},
                              {-sin(theta),0,cos(theta),0},
                              {0,0,0,1}};
                
  C = MatrixMultiply(yRotateMatrix, C);
}

void RotateZ(float theta)
{
  float [][] zRotateMatrix = {{0,cos(theta),-sin(theta),0},
                              {0,sin(theta),cos(theta),0},
                              {0,0,1,0},
                              {0,0,0,1}};
                
  C = MatrixMultiply(zRotateMatrix, C);
}
