shader_type canvas_item;

uniform float brightness : hint_range(0.0, 1.0, 0.1) = 1.0;
uniform float contrast = 1.0;
uniform float saturation = 1.0;

void fragment() {
	vec3 c = texture(TEXTURE, UV, 0.0).rgb;
	c.rgb = mix(vec3(0.0), c.rgb, brightness);
	c.rgb = mix(vec3(0.5), c.rgb, contrast);
	float gray = (c.r + c.g + c.b) / 3.0;
	c.rgb = mix(vec3(gray), c.rgb, saturation);
	COLOR.rgb = c;
}
