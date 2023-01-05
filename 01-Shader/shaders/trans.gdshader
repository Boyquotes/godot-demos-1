shader_type spatial;

#include "shaders/func.gdshaderinc"

void fragment() {
	vec2 uv_rotation = rotate(UV, vec2(0.5, 0.5), TIME);
	float poly = polygon(uv_rotation, 0.6, 5);
	ALBEDO = vec3(poly);
}
