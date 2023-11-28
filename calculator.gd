extends Control
@onready var screen = $Screen
@onready var NumBox = $Screen/NumBox
func _ready():
	for button in screen.get_children():
		if button.name.is_valid_int():
			button.pressed.connect(Callable(self, "_number_buttons").bind(button))
func _number_buttons(button):
	NumBox.text += button.name
func _on_equal_pressed():
	var result: float
	
	NumBox.text = result
func _on_add_pressed():
	NumBox.text += " + "
func _on_subtract_pressed():
	NumBox.text += " - "
func _on_multiply_pressed():
	NumBox.text += " * "
func _on_divide_pressed():
	NumBox.text += " / "
func _on_negate_pressed():
	pass # Replace with function body.
func _on_delete_pressed():
	NumBox.text = ""
