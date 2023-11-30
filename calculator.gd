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
	var agggg = NumBox.text.split(" ", false, 0)
	var number1: float = agggg[0].to_float()
	var operator = agggg[1]
	var number2: float = agggg[2].to_float()
	match operator:
		"+":
			result = number1 + number2
		"-":
			result = number1 - number2
		"/":
			result = number1 / number2
		"*":
			result = number1 * number2
	NumBox.text = str(result)
func _on_add_pressed():
	NumBox.text += " + "
func _on_subtract_pressed():
	NumBox.text += " - "
func _on_multiply_pressed():
	NumBox.text += " * "
func _on_divide_pressed():
	NumBox.text += " / "
func _on_negate_pressed():
	NumBox.text += "-"
func _on_delete_pressed():
	NumBox.text = ""
func _on_decimal_pressed():
	NumBox.text += "."
