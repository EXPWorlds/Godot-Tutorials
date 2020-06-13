extends Node2D

onready var _TextureRect = self.find_node("Viewport_TextureRect")
onready var _Spacial_Viewport = self.find_node("Spacial_Viewport")

func _on_Viewport_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		
		var texture_position = event.position
		var normalized_position = texture_position / self._TextureRect.rect_size
		var spacial_viewport_position = normalized_position * self._Spacial_Viewport.size
		
		var new_event = InputEventMouseButton.new()
		new_event.button_index = BUTTON_LEFT
		new_event.pressed = true
		new_event.position = spacial_viewport_position
		
		self._Spacial_Viewport.input(new_event)
