//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 s_col = vec4 (texture2D(gm_BaseTexture, v_vTexcoord));
	float channels = 1024.0 *(s_col.r + s_col.g + s_col.b);

	s_col.r += channels;
	s_col.g += channels;
	s_col.b += channels;

	gl_FragColor =  v_vColour * s_col;
}
