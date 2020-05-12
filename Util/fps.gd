extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


onready var fps_label = get_node('Label')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fps_label.set_text(str(Engine.get_frames_per_second()))
	pass
