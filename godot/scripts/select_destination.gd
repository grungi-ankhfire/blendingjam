
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var active_nodes
var inactive_nodes
var initialized = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	active_nodes = get_children()
	inactive_nodes = []

func remove_active(the_node):
	#active_nodes.remove(the_node)
	#inactive_nodes.push_back(the_node)
	pass

func choose_destination():
	if not initialized:
		initialized=true
		active_nodes = get_children()
		inactive_nodes = []
	if active_nodes == null:
		return
	var positions = get_children()
	var selected_position = null
	if randi(100) < 85 or  inactive_nodes == []:
		print("FSCK")
		print(active_nodes)
		selected_position = active_nodes[randi() % active_nodes.size()]
	else:
		selected_position = inactive_nodes[randi() % inactive_nodes.size()]
	return selected_position
