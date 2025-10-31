extends Control

@onready var next_button: Button = %NextButton
@onready var rich_text_label: RichTextLabel = %RichTextLabel

var dialogue_items: Array[String] = [
	"My name is Walter Hartwell White.",
	"I live at 308 Negra Arroyo Lane, Albuquerque, New Mexico, 87104.",
	"This is my confession.",
	"If you’re reading this text, I’m probably dead",
	"murdered by my brother-in-law, Hank Schrader.",
	]

var current_item_index := 0

func _ready() -> void:
	show_text()
	next_button.pressed.connect(advance)

func show_text() -> void:
	var current_item := dialogue_items[current_item_index]
	rich_text_label.text = current_item
	
func advance() -> void:
	current_item_index += 1
	if current_item_index == dialogue_items.size():
		get_tree().quit()
	else:
		show_text()
