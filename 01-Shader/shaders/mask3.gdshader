shader_type spatial;

#include "shaders/func.gdshaderinc"

uniform sampler2D tex;
uniform vec3 color : source_color;

void fragment() {
	vec3 logo1 = texture(tex, UV).rgb;
	vec2 uv_rotation = rotate(UV, vec2(0.5), TAU / 0.5);
	vec3 logo2 = texture(tex, uv_rotation).rgb;
	logo2 = (logo2.r + logo2.g + logo2.b) / 3.0 * color;
	
	float df = distance(UV, vec2(0.5));
	float mask = step(abs(sin(1.5 * TIME)), df);
	vec3 interpolation = mix(logo1, logo2, mask);
	ALBEDO = interpolation;
}
