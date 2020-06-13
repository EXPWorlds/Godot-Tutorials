extends Control

onready var Falcon9 = self.get_node("Falcon9")
onready var Info = self.get_node("Label")


export(float, 0, 1, 0.001) var landedness
export(Curve) var landing_curve
var curve_output
var height

var is_auto_landing = false
var auto_landing_speed = 0.01


func _process(delta):
	if is_auto_landing:
		self.handle_auto_landing()
	
	self.curve_output = self.landing_curve.interpolate(self.landedness)
	
	
	self.height = self.curve_output * 426 + 146
	
	
	self.Falcon9.position.y = self.height
	
	
	self.update_info_label()


func update_info_label():
	var new_text = "Landedness: " + str(self.landedness) + "\n"
	new_text += "Curve Output: " + str(self.curve_output) + "\n"
	new_text += "Height: " + str(572 - self.height)
	self.Info.text = new_text


func handle_auto_landing():
	self.landedness += self.auto_landing_speed
	if self.landedness >= 1.0:
		self.landedness = 1.0
		self.is_auto_landing = false


func _on_Button_pressed():
	self.is_auto_landing = true
	self.landedness = 0.0


func _on_Reset_Button_pressed():
	self.landedness = 0.0
