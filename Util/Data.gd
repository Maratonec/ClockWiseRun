extends Node


# Declare member variables here. Examples:
var level = 1
var save_data = {"level_save":0}
var saveLevel = File.new()
var save_path = "user://level.save"
onready var data = get_node("/root/Data")
		

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_auto_accept_quit(false)
	if not saveLevel.file_exists(save_path):
		create_save()
		save(level)
		print(level)
	level = load_game()
func save(data_save):
	save_data["level_save"] = data_save
	saveLevel.open(save_path, File.WRITE)
	saveLevel.store_var(save_data)
	saveLevel.close()
	
func create_save():
	saveLevel.open(save_path, File.WRITE)
	saveLevel.store_var(save_data)	
	saveLevel.close()
	
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save(level)
		print(load_game())
		get_tree().quit()
		
		
		
func load_game():
	saveLevel.open(save_path, File.READ)
	save_data = saveLevel.get_var()
	saveLevel.close()
	return save_data["level_save"]
