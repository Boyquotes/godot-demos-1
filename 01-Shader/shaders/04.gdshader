shader_type canvas_item;

uniform float dist = 0.7;

void fragment() {
	vec3 current_color = texture(TEXTURE, UV).rgb;
	vec3 right_color = texture(TEXTURE, UV + vec2(SCREEN_PIXEL_SIZE.x, 0)).rgb;
	vec3 bottom_color = texture(TEXTURE, UV + vec2(0, SCREEN_PIXEL_SIZE.y)).rgb;
	float r_dist = length(current_color - right_color);
	float b_dist = length(current_color - bottom_color);
	
	COLOR.rgb = (r_dist > dist || b_dist > dist) ? vec3(1.0) : vec3(0.0);
}
