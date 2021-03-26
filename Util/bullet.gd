extends Area2D

var speed = 100
onready var Player = get_node("../Player")
func _physics_process(delta):
	position += transform.x * speed * delta
func _ready():
	var name = get_name()
	$".".connect("body_entered", Player, "_on_bullet_body_entered", [name])
	




