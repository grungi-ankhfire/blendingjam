
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var state = 0
var frames

func _ready():
	set_process_input(true)


func _input(event):
	if(event.type == InputEvent.MOUSE_BUTTON and event.pressed == false):
		if state == 0:
			get_node("text0").hide()
			state += 1
			get_node("frames").frame = 1
			get_node("text1").show()
		elif state == 1:
			get_node("text2").show()
			state += 1
		elif state == 2:
			get_node("text1").hide()
			get_node("text2").hide()
			get_node("frames").frame = 2
			get_node("text3").show()
			state += 1
		elif state == 3:
			get_node("text4").show()
			state += 1
		elif state == 4:
			get_node("text3").hide()
			get_node("text4").hide()
			get_node("frames").frame = 4
			get_node("text5").show()
			state += 1
		elif state == 5:
			get_node("text5").hide()
			get_node("frames").frame = 3
			get_node("text6").show()
			state += 1
		elif state == 6:
			pass
