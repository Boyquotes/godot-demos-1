shader_type canvas_item;

#include "chaps/funcs.gdshaderinc"

uniform vec3 colorA : source_color = vec3(0.149,0.141,0.912);
uniform vec3 colorB : source_color = vec3(1.000,0.833,0.224);

void fragment() {
	vec2 st = UV;
	vec3 color = vec3(0.0);
    vec3 pct = vec3(st.x);
	
	pct.r = smoothstep(0.0, 1.0, st.x);
    pct.g = sin(st.x * PI);
    pct.b = pow(st.x, 0.5);
	
	color = mix(colorA, colorB, pct);
	
	color = mix(color, vec3(1.0, 0.0, 0.0), plot(st, pct.r));
    color = mix(color, vec3(0.0, 1.0, 0.0), plot(st, pct.g));
    color = mix(color, vec3(0.0, 0.0, 1.0), plot(st, pct.b));
	
	COLOR = vec4(color, 1.0);
}
