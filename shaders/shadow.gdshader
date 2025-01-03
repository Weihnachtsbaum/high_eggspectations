shader_type canvas_item;
render_mode blend_mix;

float when_neq(float x, float y) {
	return abs(sign(x - y));
}

void fragment() {
	float neq = when_neq(texture(TEXTURE, UV).a, 0.0);
	COLOR = vec4(0., 0., 0., neq);
}