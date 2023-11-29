// Vertex shader
// The vertex shader is run once for every vertex
// It can change the (x,y,z) of the vertex, as well as its normal for lighting.

#define PROCESSING_TEX_SHADER

// Set automatically by Processing
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 lightNormal;
uniform mat4 texMatrix;
uniform sampler2D texture;

// Come from the geometry/material of the object
//attribute vec4 position;
attribute vec4 vertex;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;

// These values will be sent to the fragment shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;
varying vec4 vertTexCoordR;
varying vec4 vertTexCoordL;

varying float offset;

float Dampy() {
  float xD = abs(texCoord.x - 0.5);
  float yD = abs(texCoord.y - 0.5);
  float eD = 0.5 - ((xD > yD) ? xD : yD);

  float threshold = 0.1;
  return 5 - ((3*5/4) * (((eD <= threshold) ? threshold - eD : 0) / threshold));
}

void main() {
  float distanceFromCenter = distance(texCoord.xy, vec2(0.5, 0.5));

  vec4 vecy = vec4(vertex.xy, vertex.z + 5*Dampy()*sin(distanceFromCenter * 23 * 3.14159265358), vertex.w);
  vertColor = vec4((5*sin(distanceFromCenter * 23 * 3.14159265358) +5) / 10, 
                  (5*sin(distanceFromCenter * 23 * 3.14159265358) +5) / 10,
                  (5*sin(distanceFromCenter * 23 * 3.14159265358) +5) /10, 1);
  

  vertNormal = normalize(normalMatrix * normal);
  gl_Position = transform * vecy; 
  vertLightDir = normalize(-lightNormal);
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
}
