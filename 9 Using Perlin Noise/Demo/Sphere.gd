extends MeshInstance

func update_color(perlin_value):
	var this_material = self.get_surface_material(0)
	if perlin_value < 0:
		this_material.albedo_color = Color(1.0, 1.0 + perlin_value, 1.0 + perlin_value, 1.0)
	else:
		this_material.albedo_color = Color(1.0 - perlin_value, 1.0, 1.0 - perlin_value, 1.0)
