// Dummy routines for drawing commands.
// These are for you to write.

ArrayList<float[]> vertexStack = new ArrayList<float[]>();
int numVert = 0;
float yMin;
float yMax;
float xLeft;
float xRight;
float dxRight;
float dxLeft;
color currColor = color(0,0,0);
int minIndex;
boolean horiLine;

void Set_Color (float r, float g, float b)
{
  currColor= color(r, g, b);
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
  
  
  //Draw
  for (int y = ceil(yMin); y < yMax; y++) {
    
    for (int x = ceil(xLeft); x < xRight; x++) {
      set(x, y, currColor);
    }
    xLeft += dxLeft;
    xRight += dxRight;
  }
  
  
}
