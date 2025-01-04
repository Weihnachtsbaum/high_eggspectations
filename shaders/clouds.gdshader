shader_type canvas_item;

uniform sampler2D noise_texture1: repeat_enable;
uniform sampler2D noise_texture2: repeat_enable;

void fragment() {
	vec2 uv1 = vec2(UV.x + TIME * .03, UV.y + TIME * .005);
	vec2 uv2 = vec2(UV.x + TIME * .01, UV.y + TIME * -.01);
	float noise1 = texture(noise_texture1, uv1).r;
	float noise2 = texture(noise_texture2, uv2).r;
	float noise = noise1 * noise2;
	COLOR = vec4(1,1,1, noise);
}
