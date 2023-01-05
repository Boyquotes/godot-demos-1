shader_type canvas_item;

void fragment() {
	vec2 uv_resize = fract(UV * 5.0);
	COLOR = vec4(uv_resize, 0.0, 1.0);
	COLOR = texture(TEXTURE, uv_resize);
}
