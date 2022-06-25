shader_type canvas_item;
render_mode blend_mix;

//uniform vec2 offset = vec2(0.0, 0.0);
uniform vec4 modulate : hint_color;

//void vertex() {
//	VERTEX.x += VERTEX.y;
//}

vec2 scale(vec2 uv, float x, float y)
{
	mat2 scale = mat2(vec2(x, 0.0), vec2(0.0, y));
	
	uv -= 0.5;
	uv = uv * scale;
	uv += 0.5;
	return uv;
}

void fragment() {
	
	vec2 offset = vec2(-10.0, -10.0);
	
	vec2 ps = TEXTURE_PIXEL_SIZE;
	vec2 flippedUV = UV * vec2(1.0, 1.0);
	//ps = ps * vec2(2.0, 2.0);
	//flippedUV.y = flippedUV.y*1.0;

	//this is the shadow texture
	vec4 shadow = vec4(modulate.rgb, texture(TEXTURE, scale(UV, 1.0, 1.0) - offset * ps).a * modulate.a);
	//this is the regular texture
	vec4 col = texture(TEXTURE, UV);

	COLOR = mix(shadow, col, col.a);
	//COLOR = shadow;
}