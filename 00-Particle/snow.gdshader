shader_type canvas_item;

uniform float ratio : hint_range(0.8, 1.0, 0.1);
uniform vec2 target;

void fragment() {
	vec4 col = texture(TEXTURE, UV);
		
	if (abs(target.x - UV.x) < 0.01 && abs(target.y - UV.y) < 0.01) {
		COLOR = vec4(255.0 * ratio, 255.0 * ratio, 255.0 * ratio, col.a);
	}
	else {
		COLOR = col;
	}
}
