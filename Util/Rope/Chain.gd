extends Node2D
const LOOP = preload("res://Util/Rope/rope.tscn")
const LINK = preload("res://Util/Rope/Link.tscn")
const PLATFORM1 = preload("res://Util/Rope/platform.tscn")
const PLATFORM2 = preload("res://Util/Rope/Platform2.tscn")
const PLATFORM3 = preload("res://Util/Rope/Platform3.tscn")
const TOP = preload("res://Util/Rope/top.tscn")
export (int) var loops

func _ready():
	var Parent = $Anchor
	var Child = addLoop(Parent, 4, LOOP, 0)
	addLink(Parent, Child)
	Parent = Child
	for i in range (loops):
		Child = addLoop(Parent, 2, LOOP, 0)
		addLink(Parent, Child)
		Parent = Child
	Child = addLoop(Parent, 2, PLATFORM1, 0)
	addLink(Parent, Child)
	Parent = Child
	Child = addLoop(Parent, 0, PLATFORM2, 16)
	addLink(Parent, Child)
	Parent = Child
	Child = addLoop(Parent, 0, PLATFORM3, 16)
	addLink(Parent, Child)
	Parent = Child
	for i in range (loops):
		Child = addLoop(Parent, -2, LOOP, 0)
		addLink(Parent, Child)
		Parent = Child
	Child = addLoop(Parent, -4, TOP, 0)
	addLink(Parent, Child)
	Parent = Child
func addLoop(parent, space, type, position):
	var loop = type.instance()
	loop.position = parent.position
	loop.position.y += space
	loop.position.x += position
	add_child(loop)
	return loop
func addLink(parent, child):
	var pin = LINK.instance()
	pin.node_a = parent.get_path()
	pin.node_b = child.get_path()
	parent.add_child(pin)
