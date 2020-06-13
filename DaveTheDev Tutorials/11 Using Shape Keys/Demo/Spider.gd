extends MeshInstance

export(OpenSimplexNoise) var perlin_noise : OpenSimplexNoise
export(float) var speed = 0.5
export(float) var perlin_offset = 314.0

var time = 0.0

func _process(delta):
	
	self.time += self.speed
	
	var abdomin_size = (self.perlin_noise.get_noise_2d(self.time, 1.0) + 1.0) / 2.0
	var eyes_size = (self.perlin_noise.get_noise_2d(self.time + self.perlin_offset, 1.0)) + 1.0 / 2.0
	var legs_length = (self.perlin_noise.get_noise_2d(self.time + self.perlin_offset * 2.0, 1.0) + 1.0) / 2.0
	var legs_thickness = (self.perlin_noise.get_noise_2d(self.time + self.perlin_offset * 3.0, 1.0) + 1.0) / 2.0
	var mandables_length = (self.perlin_noise.get_noise_2d(self.time + self.perlin_offset * 4.0, 1.0) + 1.0) / 2.0
	var mandables_size = (self.perlin_noise.get_noise_2d(self.time + self.perlin_offset * 5.0, 1.0) + 1.0) / 2.0
	
	self.set("blend_shapes/Abdomin_Size", abdomin_size)
	self.set("blend_shapes/Eyes_Size", eyes_size)
	self.set("blend_shapes/Legs_Length", legs_length)
	self.set("blend_shapes/Legs_Thickness", legs_thickness)
	self.set("blend_shapes/Mandables_Length", mandables_length)
	self.set("blend_shapes/Mandables_Size", mandables_size)
