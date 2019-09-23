extends Spatial

var rotation_speed = PI / 2.0

func _process(delta):
	self.rotate_y(self.rotation_speed * delta)