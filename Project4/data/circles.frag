// Fragment shader

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_LIGHT_SHADER

// These values come from the vertex shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;

void circle(float x, float y, float r) {
  float distanceFromCenter = distance(vertTexCoord.xy, vec2(x, y));
  
  if (distanceFromCenter < r) {
    gl_FragColor.a = 0;
  }
}

void main() { 

  vec4 diffuse_color = vec4 (0.0, 1.0, 1.0, 1.0);
  float diffuse = clamp(dot (vertNormal, vertLightDir),0.0,1.0);
  gl_FragColor = vec4(diffuse * diffuse_color.rgb, 0.8);

  

  // change the transparency based on the texture coordinates
  gl_FragColor.a = 1;

  
  circle(0.5, 0.5, 0.065);

  for (int i = 0; i < 6; ++i) {
    for (int j = 1; j < 4; ++j) {
      circle(0.5 + j * 0.125 * cos(i * 3.14159265358/3), 0.5 + j * 0.125 * sin(i  * 3.14159265358/3), 0.05/j);
    }
  }
}

