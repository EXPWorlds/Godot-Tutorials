shader_type spatial;
render_mode unshaded;

uniform sampler2D perlin_texture;

void vertex()
{
	float radius_amplitude = 2.0;
	float procession_amplitude = 20.0;
	
	float procession_level = (float(INSTANCE_ID) / 1080.0) * 128.0;
	
	float procession_x = texture(perlin_texture, vec2(TIME / 64.0, procession_level / 1080.0)).x * procession_amplitude;
	float procession_z = texture(perlin_texture, vec2(TIME / 64.0, 0.2 + procession_level / 1080.0)).x * procession_amplitude;
	
	float radius = abs(texture(perlin_texture, vec2(TIME, float(INSTANCE_ID) / 1080.0)).x * radius_amplitude);
	float rotation_base_angle = texture(perlin_texture, vec2(float(INSTANCE_ID) / 1080.0, float(INSTANCE_ID) / 1080.0)).x * 8.0;
	float rotation_angle = (rotation_base_angle * 3.14) + TIME * 32.0;
	radius = radius + (float(INSTANCE_ID) / 1080.0) * (float(INSTANCE_ID) / 1080.0) * 10.0;
	
	VERTEX.y = VERTEX.y + float(INSTANCE_ID) * 0.03;
	VERTEX.x = VERTEX.x + radius * cos(rotation_angle + (VERTEX.z / 0.5)) + procession_x;
	VERTEX.z = VERTEX.z + radius * sin(rotation_angle + (VERTEX.z / 0.5)) + procession_z;
	
	float color = texture(perlin_texture, vec2(TIME / 64.0, ( procession_level / 1080.0))).x - 0.4;
	COLOR = vec4(color, color, color, 1.0);
}

void fragment()
{
	ALBEDO = COLOR.rgb;
}