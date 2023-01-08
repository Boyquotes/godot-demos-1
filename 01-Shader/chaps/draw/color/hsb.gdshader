shader_type canvas_item;

#include "chaps/funcs.gdshaderinc"

void fragment() {
	vec2 st = vec2(UV.x, 1.0 - UV.y);
	vec3 color = vec3(0.0);
	
	vec2 to_center = vec2(0.5) - st;
    float angle = atan(to_center.y, to_center.x);
    float radius = length(to_center) * 2.0;
	
	color = hsb2rgb(vec3((angle / TAU) + 0.5, radius, 1.0));
	
	COLOR = vec4(color, 1.0);
}
