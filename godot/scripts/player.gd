
extends Sprite

export var speed = 50.0
var heading_direction_h = 0.0
var heading_direction_v = 0.0
var anim

func _ready():
	set_process(speed)
	anim = get_node("./animator")

func _process(deltatime):
	var pos = get_pos()
	pos.x += speed * deltatime * heading_direction_h
	pos.y += speed * deltatime * heading_direction_v
	pos = bound_pos(pos)
	set_pos(pos)
	
func bound_pos(pos):
	if pos.x > 152:
		pos.x = 152
	if pos.y > 152:
		pos.y = 152
	if pos.y < 28:
		pos.y = 28
	if pos.x < 28:
		pos.x = 28
	return pos
	
func go_left():
	heading_direction_h = -1.0
	
func go_right():
	heading_direction_h = 1.0
	
func go_up():
	heading_direction_v = -1.0

func go_down():
	heading_direction_v = 1.0

func stop_h():
	heading_direction_h = 0.0
	
func stop_v():
	heading_direction_v = 0.0