extends Button



onready var data = get_node("/root/Data")
func _ready():
	pass 

func _pressed():
	var change = "res://Levels/" + str(data.level) + ".tscn"
	get_tree().change_scene(change)	

