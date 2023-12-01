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
	var agggg = NumBox.text.split(" ", false, 0)
	var result: float = agggg[0].to_float()
	var count: float = agggg.size() - 1
	if count <= 1:
		pass
	else:
		var finder = 1
		var number1 = agggg[0].to_float()
		var number2 = agggg[finder+1].to_float()
		var operator = agggg[finder]
		while count > 0:
			match operator:
				"+":
					result = number1 + number2
				"-":
					result = number1 - number2
				"/":
					result = number1 / number2
				"*":
					result = number1 * number2
			count -= 2
			if count <= 1:
				break
			finder += 2
			number1 = result
			operator = agggg[finder]
			number2 = agggg[finder+1].to_float()
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
