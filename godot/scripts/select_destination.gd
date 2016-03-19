
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func choose_destination():
	var positions = get_children()
	var selectet_position = positions[randi() % get_child_count()].get_pos()
	return selectet_position
