// 
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 center;

void main()
{
    float max_dist = 1000.;
    
    float xdiff = center.x-in_Position.x;
    float xdiff2 = xdiff*xdiff;
    float ydiff = center.y-in_Position.y;
    float ydiff2 = ydiff*ydiff;    
    float dist = ((xdiff*xdiff)+(ydiff*ydiff));
    
    if (dist < max_dist*max_dist)
    {    
        float distx = xdiff/max_dist;
        float disty = ydiff/max_dist;
        float distz = (center.z-in_Position.z)/max_dist;
        float new_z = sqrt(1. - distx*distx - disty*disty) - 1.;
        vec4 object_space_pos = vec4( in_Position.x, in_Position.y, new_z*max_dist+in_Position.z, 1.0);
        gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
        v_vColour = in_Colour;
    }
    else
    {
        gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position.x, in_Position.y, -800., 1.0);
        v_vColour = vec4(0., 0., 0., 0.);
    }
    
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

