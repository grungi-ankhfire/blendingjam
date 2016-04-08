
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass




func _on_Start_pressed():
	get_tree().change_scene("res://scenes/intro.scn")






func _on_Exit_pressed():
	get_tree().quit()
