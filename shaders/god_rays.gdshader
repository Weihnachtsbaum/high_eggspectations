shader_type canvas_item;

void fragment() {
	float dist_right = UV.y * .5 + .5 - UV.x;
	float dist_left = UV.x * 2. - 1. + UV.y;
	float edge_fade =
		smoothstep(0., .1, dist_right) *
		smoothstep(0., .1, dist_left);
	
	float pos = (UV.x - .5) / UV.y;
	float a1 = abs(sin(pos * 10. + TIME * .5)) * .4;
	float a2 = abs(sin(pos * 20. - TIME)) * .2;
	
	float a = (a1 + a2) * edge_fade;
	COLOR = vec4(.95, .9, .8, a);
}
