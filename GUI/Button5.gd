extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var credits = get_node('../../Node2D2')
onready var p = get_node('../../P')
onready var plabel = get_node('../../Label')
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _pressed():
	credits.set_visible(false)
	p.set_visible(true)
	plabel.set_visible(true)
