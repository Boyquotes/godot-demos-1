shader_type spatial;

void fragment() {
	vec2 uv_cartesian = UV * 2.0 - 1.0;
	float angle = atan(uv_cartesian.x, uv_cartesian.y);
	angle /= TAU;
	angle += 0.5;
	float strength = cos(angle * 100.0 + TIME);
	strength = step(0.5, strength);
	
	ALBEDO = vec3(strength);
}
