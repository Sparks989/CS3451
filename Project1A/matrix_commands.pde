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
             
ArrayList<float[][]> matrixStack = new ArrayList<float[][]>();
int currentTop = 0;

void Init_Matrix()
{
    currentTop = 0;
    matrixStack.add(I);
    C = matrixStack.get(currentTop);
    
}

void Push_Matrix()
{
  
  float [][] oldTop = new float[4][4];
  oldTop = matrixStack.get(currentTop).clone();

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

void matrixStackSetter(float[][] m) {
  matrixStack.remove(currentTop);
  matrixStack.add(m);
}

void Translate(float x, float y, float z)
{
  float [][] translateMatrix = {{1,0,0,x},
                                {0,1,0,y},
                                {0,0,1,z},
                                {0,0,0,1}};
                                
  C = MatrixMultiply(C,translateMatrix);
}

void Scale(float x, float y, float z)
{
  float [][] scaleMatrix = {{x,0,0,0},
                            {0,y,0,0},
                            {0,0,z,0},
                            {0,0,0,1}};
                            
  matrixStackSetter(MatrixMultiply(C,scaleMatrix));
}

void RotateX(float theta)
{
  theta = theta*PI/180.0;
  float [][] xRotateMatrix = {{1,0,0,0},
                              {0,cos(theta),-sin(theta),0},
                              {0,sin(theta),cos(theta),0},
                              {0,0,0,1}};
                
  matrixStackSetter(MatrixMultiply(C,xRotateMatrix));
}

void RotateY(float theta)
{
  theta = theta*PI/180.0;
  float [][] yRotateMatrix = {{cos(theta),0,sin(theta),0},
                              {0,1,0,0},
                              {-sin(theta),0,cos(theta),0},
                              {0,0,0,1}};
                
  matrixStackSetter(MatrixMultiply(C,yRotateMatrix));
}

void RotateZ(float theta)
{
  theta = theta*PI/180.0;
  float [][] zRotateMatrix = {{0,cos(theta),-sin(theta),0},
                              {0,sin(theta),cos(theta),0},
                              {0,0,1,0},
                              {0,0,0,1}};
                
  matrixStackSetter(MatrixMultiply(C,zRotateMatrix));
}
