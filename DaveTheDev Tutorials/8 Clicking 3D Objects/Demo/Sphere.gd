extends Spatial

var Number_Generator = RandomNumberGenerator.new()
var rotation_speed = PI / 2.0


func _process(delta):
	self.rotate_y(self.rotation_speed * delta)


func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			self.randomize_color()


func randomize_color():
	self.Number_Generator.randomize()
	var new_red = self.Number_Generator.randf_range(0.0, 1.0)
	self.Number_Generator.randomize()
	var new_green = self.Number_Generator.randf_range(0.0, 1.0)
	self.Number_Generator.randomize()
	var new_blue = self.Number_Generator.randf_range(0.0, 1.0)
	var new_color = Vector3(new_red, new_green, new_blue).normalized()
	var this_material = self.get_node("Mesh_Sphere").get_surface_material(0)
	this_material.albedo_color = Color(new_color.x, new_color.y, new_color.z, 1.0)