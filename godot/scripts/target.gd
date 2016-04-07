
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
export(NodePath) var bed

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func get_bed():
	return get_node(bed)

