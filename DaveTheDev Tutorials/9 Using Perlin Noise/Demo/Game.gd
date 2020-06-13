extends Spatial

onready var Sphere_Root = self.get_node("Sphere_Root")
var Unit_Sphere = preload("res://9 Using Perlin Noise/Demo/Sphere.tscn")

enum state {RANDOM, PERLIN}
export(state) var current_state = state.PERLIN
export(float) var amplitude = 10.0
export(float) var speed = 0.2
export(OpenSimplexNoise) var perlin_noise

var time = 0.0

func _ready():
	for x in range(-20.0, 20.0, 1.0):
		for z in range(-20.0, 20.0, 1.0):
			var New_Sphere = Unit_Sphere.instance()
			self.Sphere_Root.add_child(New_Sphere)
			New_Sphere.translation = Vector3(x, 0.0, z)


func _process(delta):
	time += speed
	
	var spheres = self.Sphere_Root.get_children()
	for sphere in spheres:
		
		match current_state:
			state.RANDOM:
				randomize()
				var random_value = (randf() * 2.0) - 1.0
				var vertical_offset = random_value * amplitude
				sphere.translation.y = vertical_offset
				sphere.update_color(random_value)
			
			state.PERLIN:
				var perlin_value = perlin_noise.get_noise_2d(sphere.translation.x + time, sphere.translation.z)
				var vertical_offset = perlin_value * amplitude
				sphere.translation.y = vertical_offset
				sphere.update_color(perlin_value)
	
