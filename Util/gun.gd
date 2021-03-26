extends Position2D

onready var BULLET = preload("res://Util/bullet1.tscn")
export(float) var delay
var timer = 0
func shoot():
	var bullet = BULLET.instance()
	get_node("../").add_child(bullet)
	bullet.transform = $".".global_transform

func _process(delta):
	if(timer >= delay):
		timer-= delay
		shoot()
	timer += delta
