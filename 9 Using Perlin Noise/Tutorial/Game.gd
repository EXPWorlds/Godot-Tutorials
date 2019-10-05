extends Spatial

onready var Sphere : MeshInstance = self.get_node("Sphere")

export(OpenSimplexNoise) var perlin_noise
export(float) var amplitude = 5.0
export(float) var speed = 0.2

var time : float = 0.0

func _process(delta) -> void:
	
	self.time += self.speed
	var perlin_value = self.perlin_noise.get_noise_2d(self.time, 0.0)
	self.Sphere.translation.y = perlin_value * amplitude