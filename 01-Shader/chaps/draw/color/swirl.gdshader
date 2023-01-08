shader_type canvas_item;

#include "chaps/funcs.gdshaderinc"

void fragment() {
//	vec2 uv_cartesian = 2.0 * UV - 1.0;
	
	float swirl = swirl(UV, 30.0, 8);
	COLOR = vec4(vec3(swirl), 1.0);
	
//	vec2 grid = grid(UV, 6.0, 6.0);
//    COLOR = vec4(grid.r, grid.g, 0.0, 1.0);
}
