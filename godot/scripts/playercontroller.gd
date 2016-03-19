
extends Node

var player
var last_h_axis = 0
var last_w_axis = 0

func _ready():
	player = get_node("..")
	set_process(true)
	
func _process (deltatime):
	var h_axis = get_h_axis()
	var w_axis = get_w_axis()
	
	if last_h_axis != h_axis or last_w_axis != w_axis:
		move_player(h_axis, w_axis)
	
	last_h_axis = h_axis
	
	last_w_axis = w_axis
	
func get_h_axis():
	var h_axis = 0
	if Input.is_action_pressed("ui_left"):
		h_axis -= 1
	if Input.is_action_pressed("ui_right"):
		h_axis += 1
	return h_axis
	
func get_w_axis():
	var w_axis = 0
	if Input.is_action_pressed("ui_up"):
		w_axis += 1
	if Input.is_action_pressed("ui_down"):
		w_axis -= 1
	return w_axis
	
func move_player(h_axis, w_axis):
	if h_axis > 0:
		player.go_right()
	elif h_axis < 0:
		player.go_left()
	else:
		player.stop_h()
	if w_axis > 0:
		player.go_up()
	elif w_axis < 0: 
		player.go_down()
	else:
		player.stop_v()
	
	


