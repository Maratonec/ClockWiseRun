extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var data = get_node("/root/Data")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _pressed():
	var change = "res://Levels/" + str(data.level) + ".tscn"
	get_tree().change_scene(change)	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
