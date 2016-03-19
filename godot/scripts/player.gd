
extends Sprite

export var speed = 1.0
var heading_direction_h = 0.0
var heading_direction_v = 0.0
var anim

func _ready():
	set_process(speed)
	anim = get_node("./animator")

func _process(deltatime):
	var a = speed * deltatime * heading_direction_h
	var b = speed * deltatime * heading_direction_v
	get_node("..").move(Vector2(a, b))
	
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