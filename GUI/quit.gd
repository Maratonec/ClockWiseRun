extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var license = get_node('../../Node2D')
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _pressed():
	license.set_visible(false)
