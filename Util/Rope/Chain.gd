extends Node2D
const LOOP = preload("res://Util/Rope/rope.tscn")
const LINK = preload("res://Util/Rope/Link.tscn")
const PLATFORM = preload("res://Util/Rope/platform.tscn")

export (int) var loops

func _ready():
	var Parent = $Anchor
	var Child = addLoop(Parent, 4, LOOP)
	addLink(Parent, Child)
	Parent = Child
	for i in range (loops):
		Child = addLoop(Parent, 2, LOOP)
		addLink(Parent, Child)
		Parent = Child
	Child = addLoop(Parent, 2, PLATFORM)
	addLink(Parent, Child)
	Parent = Child
func addLoop(parent, space, type):
	var loop = type.instance()
	loop.position = parent.position
	loop.position.y += space
	add_child(loop)
	return loop
func addLink(parent, child):
	var pin = LINK.instance()
	pin.node_a = parent.get_path()
	pin.node_b = child.get_path()
	parent.add_child(pin)
