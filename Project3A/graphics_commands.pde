// Dummy routines for drawing commands.
// These are for you to write.

ArrayList<float[]> vertexStack = new ArrayList<float[]>();
int numVert = 0;
float yMin;
float yMax;
float xMin;
float xMax;
float xLeft;
float xRight;
float dxRight;
float dxLeft;
color currColor = color(0,0,0);
int minIndex;
int maxIndex;
boolean horiLine;

void Set_Color (float r, float g, float b)
{
  currColor = color(r, g, b);
}

void Vertex(float x, float y, float z) {
  float[] vert = new float[]{x, y, z};
  vertexStack.add(vert);
  numVert++;
}

void Begin_Shape() {
  vertexStack.clear();
  numVert = 0;
  currColor = color(0,0,0);
  yMin = 50000;
  yMax = 0;
  minIndex = 0;
  horiLine = false;
}

void End_Shape() {
  //Find yMin & yMax
  for (int i = 0; i < 3; i++) {
    if (vertexStack.get(i)[1] > yMax) {
      yMax = vertexStack.get(i)[1];
      maxIndex = i;
    }
    if (vertexStack.get(i)[1] < yMin) {
      yMin = vertexStack.get(i)[1];
      minIndex = i;
    }
  }
  
  //Find xLeft & xRight, dxLeft & dxRight
  if (vertexStack.get(0)[1] == vertexStack.get(1)[1]) {
    horiLine = true;
  } else if (vertexStack.get(1)[1] == vertexStack.get(2)[1]) {
    horiLine = true;  
  } else if (vertexStack.get(2)[1] == vertexStack.get(0)[1]) {
    horiLine = true;
  }
  xLeft = vertexStack.get(minIndex)[0];
  xRight = vertexStack.get(minIndex)[0];
  
  xMin = vertexStack.get(minIndex)[0];
  xMax = vertexStack.get(maxIndex)[0];
  
  
  //Draw
  for (int y = ceil(yMin); y < yMax; y++) {
    dxLeft = (xMax - xMin) / (yMax - yMin);
    dxRight = (xMax - xMin) / (yMax - yMin);
    
    for (int x = ceil(xLeft); x < xRight; x++) {
      set(x, y, currColor);
    }
    xLeft += dxLeft;
    xRight += dxRight;
  }
  
  
}
