extends Node

var state = 0
var frames

func _ready():
	set_process_input(true)


func _input(event):
	if(event.is_action("ui_accept") and event.pressed == false):
		if state == 0:
			state += 1
			get_node("frames").frame = 1
			get_node("Label").show()
		elif state == 1:
			get_tree().change_scene("res://scenes/main_menu.scn")


