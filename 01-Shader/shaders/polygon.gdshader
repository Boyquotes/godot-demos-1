shader_type spatial;

const float TWO_PI = 6.28318530718;

float polygon(vec2 uv, float width, int sides) {
	uv = uv * 2.0 - 1.0;

	float angle = atan(uv.x, uv.y);
	float radius = TWO_PI / float(sides);
	
	float dist = cos(floor(0.5 + angle / radius) * radius - angle) * length(uv);
	float poly = step(width, dist);
	return poly;
}

void fragment() {
	float poly = polygon(UV, 0.7, 6);
	ALBEDO = vec3(poly);
}
