// Fragment shader

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEX_SHADER

// Set in Processing
uniform sampler2D texture;

// These values come from the vertex shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;

varying float offset;

void main() { 
  gl_FragColor = vertColor;
  vec4 diffuse_color = vertColor;
  float diffuse = clamp(dot (vertNormal, vertLightDir),0.0,1.0);
  gl_FragColor.rgb = diffuse * diffuse_color.rgb + vec3(0.2,0.2,0.2);//,0.0);
}
