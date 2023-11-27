// Fragment shader

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_LIGHT_SHADER

uniform float cx;
uniform float cy;

// These values come from the vertex shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;

vec2 square(vec2 vect) {
  return vec2(pow(vect.x, 2) - pow(vect.y, 2), 2* vect.x*vect.y);
}

vec2 exponent(vec2 curr) {
    curr = square(curr);
    return square(curr) + vec2(cx, cy);
}

void zChecker(vec2 z) {
  vec2 currZ = z;

  for (int i = 0; i < 20; i++) {
    currZ = exponent(currZ);
    if (length(currZ) > 20) {
      return;
    }
  }
  gl_FragColor = vec4(1.0,1.0,1.0,1.0);
}



void main() { 
  
  vec4 diffuse_color = vec4 (1.0, 0.0, 0.0, 1.0);  // red
  float diffuse = abs(dot (vertNormal, vertLightDir));
  gl_FragColor = vec4(diffuse * diffuse_color.rgb, 1.0);
  gl_FragColor.a = 1.0;

  zChecker(vec2((vertTexCoord.x - 0.5) * 2.5, (vertTexCoord.y - 0.5) * 2.5));
}
