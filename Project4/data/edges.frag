// Fragment shader
// The fragment shader is run once for every pixel
// It can change the color and transparency of the fragment.

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXLIGHT_SHADER

// Set in Processing
uniform sampler2D my_texture;
uniform float cx;
uniform float cy;

// These values come from the vertex shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;

float grayValue(vec4 color) {
  return (color.x + color.y + color.z)/3.0;
}

float laplacian(vec4 v0, vec4 v1, vec4 v2, vec4 v3, vec4 vC) {


  float L = 0.25 * (grayValue(v0)+grayValue(v1)+grayValue(v2)+grayValue(v3))-grayValue(vC);
  
   
  return  L+0.5;
}

void main() { 
  vec4 diffuse_color = texture2D(my_texture, vertTexCoord.xy);
  float diffuse = abs(dot (vertNormal, vertLightDir));
  gl_FragColor = vec4(diffuse * diffuse_color.rgb, 1.0);

  

  float distanceFromCenter = distance(vertTexCoord.xy, vec2(cx, cy));
  
  if (distanceFromCenter < 0.1) {
    float dist = 0.004;
  
    float grey;
    grey = laplacian(texture(my_texture, vec2(vertTexCoord.x - dist, vertTexCoord.y - dist)), 
      texture(my_texture, vec2(vertTexCoord.x - dist, vertTexCoord.y + dist)), 
      texture(my_texture, vec2(vertTexCoord.x + dist, vertTexCoord.y - dist)),
      texture(my_texture, vec2(vertTexCoord.x + dist, vertTexCoord.y + dist)),
      texture(my_texture, vec2(vertTexCoord.x, vertTexCoord.y)));

    

    if (grey > 0.4) {
      grey = grey - 0.1;
    }

    vec4 g = vec4(grey, grey, grey, 1.0);

    gl_FragColor = g;
  }

  


}
