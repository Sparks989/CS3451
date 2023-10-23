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
}

void End_Shape() {
  //Find yMin & yMax
  
  //Find xLeft & xRight, dxLeft & dxRight
  
  for (int y = ceil(yMin); y < yMax; y++) {
    for (int x = ceil(xLeft); x < xRight; x++) {
      set(x, y, currColor
    }
    xLeft += dxLeft;
    xRight += dxRight;
  }
  
  
}
