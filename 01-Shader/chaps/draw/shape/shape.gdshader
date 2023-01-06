shader_type canvas_item;

#include "chaps/funcs.gdshaderinc"

void fragment() {
	vec2 st = UV;
	float y = pow(st.x, 2.0);
	vec3 color = vec3(y);
	
	float pct = plot(st, y);
	color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);
	
	COLOR = vec4(color, 1.0);
}
