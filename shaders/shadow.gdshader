shader_type canvas_item;
render_mode blend_mix;

void fragment() {
	float a = sign(texture(TEXTURE, UV).a);
	COLOR = vec4(0., 0., 0., a);
}