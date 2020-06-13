extends MultiMeshInstance

func _ready():
	for x in range(20):
		for z in range(20):
			self.multimesh.set_instance_transform(z * 20 + x, Transform(Basis(), Vector3(x, 0.0, -z)))