extends MeshInstance

func _ready():
	randomize()
	self.set("blend_shapes/Morphed Sphere", randf())

