shader_type canvas_item;

uniform float hit_opacity = 0;
uniform vec3 color = vec3(1,1,1);

void fragment(){
	COLOR.rgb = texture(TEXTURE, UV).rbg * (1.0 - hit_opacity) + color * hit_opacity;
	COLOR.a = texture(TEXTURE, UV).a;
}