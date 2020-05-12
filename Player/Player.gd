extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
var MAX_SPEED = 200
const ACCELERATION = 50
const JUMP_HEIGHT = -250
var motion = Vector2()
onready var fps = get_node('../fps_label')
func _ready():
	get_node("OnScreen").connect("screen_exited", self, "_on_screen_exited") 
func _on_screen_exited():
	#die screen
	get_tree().reload_current_scene()	
func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	elif Input.is_action_pressed("left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump") && Input.is_action_pressed("shift"):
			motion.y = (JUMP_HEIGHT - 100)
		elif Input.is_action_just_pressed("jump"):
			motion.y = JUMP_HEIGHT
		if(friction):
				motion.x = lerp(motion.x, 0, 0.2)
	else:
		if(friction):
			motion.x = lerp(motion.x, 0, 0.05)
		if motion.y < 0:
			$Sprite.play("Jump")	
		else:
			$Sprite.play("Fall")	
	motion = move_and_slide(motion, UP)
	
	fps.set_text(str(Engine.get_frames_per_second()))
	pass
 


func _on_player_entered(body):
	#change level
	get_tree().change_scene("res://Levels/two.tscn")	
	pass
