extends Spatial

onready var _Camera = self.find_node("Camera")
onready var _Clickable_Object = self.find_node("Clickable_Object_Area")
onready var _clickable_object_material = self.find_node("Sphere_MeshInstance").get_surface_material(0)

const ray_length = 1000

var from : Vector3
var to : Vector3
var input_captured = false

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		
		from = self._Camera.project_ray_origin(event.position)
		to = from + self._Camera.project_ray_normal(event.position) * ray_length
		input_captured = true


func _physics_process(delta):
	if input_captured:
		var space_state = self.get_world().direct_space_state
		var result = space_state.intersect_ray(from, to, [], 0x7FFFFFFF, false, true)
		
		if not result.empty() and result["collider"] == self._Clickable_Object:
			self._clickable_object_material.albedo_color = Color(randf(), randf(), randf(), 1.0)
		
		input_captured = false
