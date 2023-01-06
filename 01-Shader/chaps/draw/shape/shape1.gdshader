shader_type canvas_item;

#include "chaps/funcs.gdshaderinc"

void fragment() {
	vec2 st = UV;
//	float y = step(0.3, st.x);
//	float y = smoothstep(0.3, 0.6, st.x);
//	float y = smoothstep(0.2, 0.5, st.x) - smoothstep(0.5, 0.8, st.x);
//	float y = abs(sin(TAU * st.x));
//	float y = fract(sin(TAU * st.x));
//	float y = mod(st.x, 0.5);
	float y = pcurve(st.x, 3.0, 1.5);
	vec3 color = vec3(y);
	
	float pct = plot(st, y);
	color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);
	
	COLOR = vec4(color, 1.0);
}
