shader_type spatial;

#include "shaders/func.gdshaderinc"

void fragment() {
	ALBEDO = vec3(random(UV));
}
