shader_type spatial;

uniform sampler2D tex;

vec2 polar_coordinates(vec2 uv, vec2 center) {
	vec2 dir = uv - center;
	float radius = length(dir) * 2.0;
	float angle = atan(dir.y, dir.x) / TAU;
	return fract(vec2(radius, angle));
}

void fragment(){
	vec2 polar_uv = polar_coordinates(UV.xy, vec2(0.5));
	ALBEDO = texture(tex, polar_uv).rgb;
}