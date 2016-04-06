
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_process_input(true)


func _input(event):
	if(event.is_action("ui_accept") and event.pressed == false):
		get_tree().change_scene("res://scenes/main_menu.scn")
		