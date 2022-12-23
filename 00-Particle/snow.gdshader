shader_type canvas_item;

uniform float ratio : hint_range(0.8, 1.0, 0.1);
uniform vec2 target;

void fragment() {
	vec4 col = texture(TEXTURE, UV);
	if (target.x == UV.x && target.y == UV.y) {
		COLOR = vec4(255.0 * ratio, 255.0 * ratio, 255.0 * ratio, col.a);
	}
	else {
		COLOR = col;
	}
}
